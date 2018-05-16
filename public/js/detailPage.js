//plugin
Vue.use(VueI18n)

// set lang
Vue.config.lang = language

// set locales
Object.keys(locales).forEach(function (lang) {
    Vue.locale(lang, locales[lang])
})

var MyVue = new Vue({
    el: '#Results',
    data: {
        results: [],
        details: [],
        lplist: [],
        selectedResult: {},
        searchArray: [],
        searchObject: {
            "id": "",
            "fullName": "",
            "firstName": "",
            "middleName": "",
            "lastName": "",
            "openedDateFrom": "",
            "openedDateTo": "",
            "businessName": "",
            "description": "",
            "roomStatus": '',
            "statusDateFrom": '',
            "statusDateTo": ''
        },
        hideSearchLink: false,
        hideSearchBar: false,
        hideLoading: true,
        hideRecordNotFound: true,
        hideStatus: false
    },
    methods: {
        GetSummaryItems: function () {
            MyVue.hideSearchLink = true;
            MyVue.hideLoading = false;
            MyVue.hideRecordNotFound = true;
            MyVue.results = ''; 
            MyVue.selectedResult = ''; 
            MyVue.details = '';
            var dataValue = {
                "token": token, "id": this.searchObject.id, "fullName": this.searchObject.fullName,
                "firstName": this.searchObject.firstName, "middleName": this.searchObject.middleName, "lastName": this.searchObject.lastName,
                "openedDateFrom": this.searchObject.openedDateFrom,
                "openedDateTo": this.searchObject.openedDateTo,
                "businessName": this.searchObject.businessName,
                "description": this.searchObject.description,
                "roomStatus": this.searchObject.roomStatus,
                "statusDateFrom": this.searchObject.statusDateFrom,
                "statusDateTo": this.searchObject.statusDateTo
            };
            $.ajax({
                type: "POST",
                url: "TDWebService.asmx/GetRestCheckIns",
                dataType: "json",
                async: true,
                data: JSON.stringify(dataValue),
                contentType: "application/json; charset=utf-8",
                cache: false,
                success: function (res) {
                    res = res.d;
                    //res = resultT.d;
                    
                    if (res) {
                        MyVue.results = res;
                    } else {
                        MyVue.hideRecordNotFound = false;
                    }
                    MyVue.hideSearchLink = false;
                    MyVue.hideLoading = true;
                },
                error: function (textStatus, errorThrown) {
                    alert("No response from Server!");
                }
            });
        },
        GetMoreDetailItem: function (result) {
            this.selectedResult = result;
            result.isRead = true;

            MyVue.details = '';

            var dataValue = { "token": token, "recordID": result.id };
            $.ajax({
                type: "POST",
                url: "TDWebService.asmx/GetCheckInsDetails",
                dataType: "json",
                async: true,
                data: JSON.stringify(dataValue),
                contentType: "application/json; charset=utf-8",
                success: function (res) {
                    res = res.d;
                    MyVue.details = res;
                },
                error: function (textStatus, errorThrown) {
                    alert("No response from Server!");
                }
            });
        },
        GetLPDropdownValues: function () {
            MyVue.lplist = '';
            var dataValue = { "token": token, "type": "HOTEL"};
            $.ajax({
                type: "POST",
                url: "TDWebService.asmx/GetRestProfessionals",
                dataType: "json",
                async: true,
                data: JSON.stringify(dataValue),
                contentType: "application/json; charset=utf-8",
                success: function (res) {
                    res = res.d;
                    MyVue.lplist = res;
                }
            });
        },
        ToggleSearchMenu: function () {
            MyVue.hideSearchBar = !MyVue.hideSearchBar;
        },
        RoomStatus: function (status) {
            if (status == "Checked In") {
                lock = true;
            } else if (status == "Checked Out") {
                lock = false;
            }
            return lock;
        },
        setStatus: function () {
            var df = moment(this.searchObject.statusDateFrom).isValid();
            var dt = moment(this.searchObject.statusDateTo).isValid();
            if (df || dt) {
                this.searchObject.roomStatus = "Checked Out";
                this.hideStatus = true;
            } else {
                this.searchObject.roomStatus = "";
                this.hideStatus = false;
            }
        },
        printFunction: function () {
            var myWindow = window.open("print.aspx", "Print", "width=795  ,height=842  ,left=150,top=200,toolbar=1,status=1,");
            //myWindow.setVal("testing");
            myWindow.selectedResult = this.selectedResult;
            myWindow.details = this.details;
            myWindow.token = token;
            myWindow.language = language;
        }
    },
    filters: {
        moment: function (date) {
            return moment(date).isValid() ? moment(date).format('MMMM Do YYYY, h:mm a') : '';
            
        },
        momentMod: function (date) {
            return moment(date).isValid() ? moment(date).format('MMMM Do YYYY') : '';

        }
    }
});

MyVue.GetLPDropdownValues();

//$("#description").backstretch("public/img/CIDBG.png");

