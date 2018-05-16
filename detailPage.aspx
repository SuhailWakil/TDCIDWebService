<%@ Page Language="C#" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="preview_dotnet_index" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <title>CID Details</title>
    <link href="public/assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="public/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    

    <%--<link href="public/css/animated.css" rel="stylesheet" type="text/css" />
    <link href="public/css/vegas.min.css" rel="stylesheet" type="text/css" />--%>
    <%--<link href="public/css/owl.carousel.css" rel="stylesheet" type="text/css" />--%>
    
    <link href="public/css/style.css" rel="stylesheet" type="text/css" />
    <link href="public/css/googleapis.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
        var token = "<%=(string)(Session["token"])%>";
        var language = "<%=(string)(Session["language"])%>";
    </script>
</head>
<body dir=<%=((string)(Session["language"])=="ar"?"rtl":"ltr")%>>
    <div id="description">
        <div v-cloak class="container" id="Results">
            <div id="navigation" v-bind:class="{'menu-hide': hideSearchBar}">
                <div class="navbar navbar-fixed-top" role="banner">
                    <div class="row">
                       <section id="search" class="white-bg">
                            <div class="container">
                                <div class="row padding-20-left">
                                    <div class="section-header">
                                        <h3 class="h1 blue"><span class="underline padding-right-20">{{ $t("labels.CIDSearch") }}</span> <span class="logout"><a href="LogOut.aspx" class="btn btn-primary btn-flat">{{ $t("labels.Signout") }}</a> </span></h3>
                                    </div>
                                </div>
                                <div class="row padding-top-10">
                                    <div class="col-md-3">
                                        <div class="form-group"><label> {{ $t("labels.OtherSearch") }}</label><textarea v-model="searchObject.description" name="description" class="form-control"></textarea></div>
                                        <div class="form-group"><label>{{ $t("labels.AccelaRef") }}</label><input type="text" v-model="searchObject.id" name="accelaId" class="form-control"></div>
                                        <button type="submit" class="btn btn-common" v-on:click="GetSummaryItems(); ToggleSearchMenu();"> {{ $t("labels.SearchAccela") }}</button><i class="fa fa-life-ring" v-on:click= "ToggleSearchMenu()"></i> 
                                    </div>
                                     <div class="col-md-2">
                                        <%--<div class="form-group"><label>Hotel Name</label><input type="text" v-model="searchObject.businessName" name="hotelName" class="form-control"></div>--%>
                                        <div class="form-group"><label>{{ $t("labels.HotelName") }}</label>
                                            <select v-model="searchObject.businessName" class="form-control">
                                              <option></option>
                                              <option v-for="lp in lplist" v-bind:value="lp.businessName">
                                                {{ lp.businessName }}
                                              </option>
                                            </select>
                                        </div>

                                        <div class="form-group"><label>{{ $t("labels.RoomStatus") }}</label>
                                            <select  v-bind:disabled="hideStatus" v-model="searchObject.roomStatus" name="status" class="form-control">
                                              <option></option>
                                              <option>Checked In</option>
                                              <option>Checked Out</option>
                                            </select>
                                        </div>
                                        <%--<div class="form-group"><label>Room Number</label><input type="text" name="name" class="form-control"></div>    --%>
                                    </div>
                                    
                                    <div class="col-md-2">
                                        <div class="form-group"><label>{{ $t("labels.CheckOutDateFrom") }}</label><input type="text" onfocus="(this.type='date')" v-model="searchObject.statusDateFrom" v-on:change="setStatus" name="statusFrom" class="form-control"></div>
                                        <div class="form-group"><label>{{ $t("labels.CheckOutDateTo") }}</label><input type="text" onfocus="(this.type='date')" v-model="searchObject.statusDateTo" v-on:change="setStatus" name="statusTo" class="form-control"></div>
                                    </div>
                                    <div class="col-md-2">
                                        <div class="form-group"><label>{{ $t("labels.CheckInDateFrom") }}</label><input type="text" onfocus="(this.type='date')" v-model="searchObject.openedDateFrom" name="openFrom" class="form-control"></div>
                                        <div class="form-group"><label>{{ $t("labels.CheckInDateTo") }}</label><input type="text" onfocus="(this.type='date')" v-model="searchObject.openedDateTo" name="openTo" class="form-control"></div>
                                    </div>

                                    <div class="col-md-2">
                                        <div class="form-group"><label>{{ $t("labels.FirstName") }}</label><input type="text" v-model="searchObject.firstName" name="name" class="form-control"></div>
                                        <div class="form-group"><label>{{ $t("labels.LastName") }}</label><input type="text" v-model="searchObject.lastName" name="lname" class="form-control"></div>
                                        <div class="form-group"><label>{{ $t("labels.FullName") }}</label><input type="text" v-model="searchObject.fullName" name="lname" class="form-control"></div>
                                    </div>
                                </div>
                            </div>
                        </section>
                    </div>
                </div>
            </div>


            <div id="small_intro" class="call-to-action main-bg">
   
                <div class="container">
                    <div class="row"> 
                        
                        <div id="SearchBut" class="col-md-1 padding-top-30" v-bind:class="{'hide-class': hideSearchLink}">
                            <span class="btn btn-common" v-on:click="ToggleSearchMenu();">{{ $t("labels.SearchMore") }}</span>
                        </div>
                        <div class="col-md-9">
                            <div class="col-sm-1 text-center"><img class="img-responsive" src="public/img/cid.png" alt=""/></div>
                            <h3 class="column-title  padding-top-30">{{ $t("labels.SearchingFor") }}: 
                                {{searchObject.id}} {{searchObject.fullName}} {{searchObject.firstName}} {{searchObject.middleName}} 
                                {{searchObject.lastName}} {{searchObject.openedDateFrom | momentMod}} {{searchObject.openedDateTo | momentMod}} 
                                {{searchObject.statusDateFrom | momentMod}} {{searchObject.statusDateTo | momentMod}} 
                                {{searchObject.businessName}} {{searchObject.description}} {{ searchObject.roomStatus }}

                            </h3>
                        </div>
                       
                    </div>
                </div>
            </div>
            <div class="description-section">
                <div class="row">
                    
                    <div class="col-sm-9 descriptions">
                        <section id="details">
                            <div class="container">
                                <span v-if="selectedResult.id"> 
                                    <div class="row">
                                        <strong>{{ $t("labels.CheckInDetails") }}</strong> <i class="fa fa-print" aria-hidden="true" v-on:click="printFunction();" ></i>
                                    </div>
                                </span>
                                <div class="row padding-top-10">
                                     <div class="col-md-3">
                                        <span v-if="selectedResult.id"> 
                                             <div class="form-group"><span class="bold-text">{{ $t("labels.AccelaRef") }}</span><span class="text-control">{{selectedResult.id}}</span></div> 
                                         </span>
                                        <span v-for="asi in selectedResult.customForms">
                                            <div class="form-group"><span class="bold-text">{{ $t("labels.CheckIn") }}</span><span class="text-control">{{ asi.StartDate + " "+ asi.CheckInTime | moment }}</span></div>
                                            <div class="form-group"><span class="bold-text">{{ $t("labels.PaymentMethod") }}</span><span class="text-control">{{asi.PaymentMethod}}</span></div>
                                        </span>
                                    </div>
                                     <div class="col-md-3">
                                        <span v-for="prof in selectedResult.professionals">
                                            <div class="form-group"><span class="bold-text">{{ $t("labels.HotelName") }}</span><span class="text-control">{{prof.businessName}}</span></div>
                                        </span>
                                        <span v-for="asi in selectedResult.customForms">
                                            <div class="form-group"><span class="bold-text">{{ $t("labels.CheckOut") }}</span><span class="text-control">{{ asi.CheckOutDate + " "+ asi.CheckOutTime | momentMod }}</span></div>
                                            <div class="form-group"><span class="bold-text">{{ $t("labels.CreditCardType") }}</span><span class="text-control">{{asi.CCType}}</span></div>
                                        </span>
                                    </div>
                                     <div class="col-md-3">
                                        <span v-for="asi in selectedResult.customForms">
                                            <div class="form-group"><span class="bold-text">{{ $t("labels.RoomNumber") }}</span><span class="text-control">{{asi.RoomorUnitNumber}}</span></div>
                                            <div class="form-group"><span class="bold-text">{{ $t("labels.Bedrooms") }}</span><span class="text-control">{{asi.Bedrooms}}</span></div>
                                            <div class="form-group"><span class="bold-text">{{ $t("labels.CardNumber") }}</span><span class="text-control">{{asi.CCNumber}}</span></div>
                                        </span>
                                    </div>
                                    <div class="col-md-3">
                                        <span v-for="asi in selectedResult.customForms">
                                            <div class="form-group"><span class="bold-text">{{ $t("labels.CheckInType") }}</span><span class="text-control">{{asi.CheckInType}}</span></div>
                                            <div class="form-group"><span class="bold-text">{{ $t("labels.OldCheckInID") }}</span><span class="text-control">{{asi.OldCheckIn}}</span></div>
                                            <%--<div class="form-group"><span class="bold-text">Paid Amount</span><span class="text-control">{{asi.PaidAmount}}</span></div>--%>
                                         </span>
                                    </div>
                                </div>
                            </div>
                        </section>

                        <section id="guest">
                            <div class="container">
                                <span id="Details" v-for="detail in details">
                                        <span v-if="selectedResult.id"> 
                                            <div class="row" padding-top-10>
                                               <strong>{{ $t("labels.GuestDetails") }} - {{detail.salutation}}</strong> 
                                            </div>
                                        </span>
                                        <div class="row padding-top-10">
                                            <div class="col-md-3">
                                                <div class="form-group"><span class="bold-text">{{ $t("labels.FirstName") }}</span><span class="text-control">{{detail.firstName}}</span></div>
                                                <div class="form-group"><span class="bold-text">{{ $t("labels.Passport") }}</span><span class="text-control">{{detail.passportNumber}}</span></div> 
                                                <div class="form-group"><span class="bold-text">{{ $t("labels.Email") }}</span><span class="text-control">{{detail.email}}</span></div>
                                                <div class="form-group"><span class="bold-text">{{ $t("labels.Phone") }}</span><span class="text-control">{{detail.phone2CountryCode}} {{detail.phone2}}</span></div>
                                                <span id="Documents" v-for="document in detail.documents">
                                                    <div class="form-group"><span class="bold-text">{{ $t("labels.DocumentType") }}</span><span class="text-control">{{document.DocumentType}}</span></div>
                                                </span>
                                            </div>
                                            <div class="col-md-3">
                                                <div class="form-group"><span class="bold-text">{{ $t("labels.LastName") }}</span><span class="text-control">{{detail.lastName}}</span></div> 
                                                <div class="form-group"><span class="bold-text">{{ $t("labels.IDNumber") }}</span><span class="text-control">{{detail.stateIDNbr}}</span></div> 
                                                <div class="form-group"><span class="bold-text">{{ $t("labels.Nationality") }}</span><span class="text-control">{{detail.nationality}}</span></div> 
                                                <div class="form-group"><span class="bold-text">{{ $t("labels.AdditionalPhone") }}</span><span class="text-control">{{detail.phone3CountryCode}} {{detail.phone3}}</span></div>
                                                <span id="Documents" v-for="document in detail.documents">
                                                    <div class="form-group"><span class="bold-text">{{ $t("labels.IssuedCountry") }}</span><span class="text-control">{{document.IssuedCountry}}</span></div>
                                                </span>
                                            </div>
                                            <div class="col-md-3">
                                                <div class="form-group"><span class="bold-text">{{ $t("labels.ArabicName") }}</span><span class="text-control">{{detail.ArabicName}}</span></div> 
                                                <div class="form-group"><span class="bold-text">{{ $t("labels.VisitPurpose") }}</span><span class="text-control">{{detail.VisitPurpose}}</span></div> 
                                                <div class="form-group"><span class="bold-text">{{ $t("labels.ResidenceCountry") }}</span><span class="text-control">{{detail.birthRegion}}</span></div> 
                                                <div class="form-group"><span class="bold-text">{{ $t("labels.ResidencyPhone") }}</span><span class="text-control">{{detail.phone1CountryCode}} {{detail.phone1}}</span></div>
                                                <span id="Documents" v-for="document in detail.documents">
                                                    <div class="form-group"><span class="bold-text">{{ $t("labels.DocumentIssuedDate") }}</span><span class="text-control">{{document.DocumentIssuedDate | momentMod}}</span></div>
                                                </span>
                                            </div>
                                             <div class="col-md-3">
                                                <div class="form-group"><span class="bold-text">{{ $t("labels.FullName") }}</span><span class="text-control">{{detail.fullName}}</span></div> 
                                                <div class="form-group"><span class="bold-text">{{ $t("labels.BirthDate") }}</span><span class="text-control">{{detail.birthDate | momentMod}}</span></div> 
                                                <div class="form-group"><span class="bold-text">{{ $t("labels.BirthPlace") }}</span><span class="text-control">{{detail.PlaceofBirth}}</span></div> 
                                                 <span id="Documents" v-for="document in detail.documents">
                                                    <div class="form-group"><span class="bold-text">{{ $t("labels.DocumentExpireDate") }}</span><span class="text-control">{{document.DocumentExpiryDate | momentMod}}</span></div>
                                                </span>
                                            </div>
                                        </div>
    
                                        <span id="Documents" v-for="document in detail.documents">
                                            <div id="screenshot-slider" class="padding-20" v-for="image in document.imageList">
                                                <img class="img-responsive" v-bind:src="'TDWebService.asmx/getImage?documentId=' + image.docNumber + '&length=' + image.docSize + '&token=<%=(string)(Session["token"])%>'" />
                                            </div>
                                        </span> 
                                </span>
                            </div>
                        </section>

                    </div>
                    <div class="col-sm-3">
                        <div class="descriptions">
                            <div v-bind:class="{'hide-class': hideLoading}">
                                <i class="fa fa-refresh fa-spin fa-3x fa-fw"></i>
                                <span>{{ $t("labels.Loading") }}...</span>
                            </div>
                            <div v-bind:class="{'hide-class': hideRecordNotFound}">
                                <h4><span>{{ $t("labels.NoRecordFound") }}...</span></h4>
                            </div>
                            <span v-for="result in results">
                                <div class="eachRow" v-on:click="GetMoreDetailItem(result);">
                                    <div class="description" v-bind:class="{'selectedResult': (result.id == selectedResult.id)}">
                                        <i class="fa" v-bind:class="[{'fa-lock': RoomStatus(result.status.value) }, {'fa-unlock': !RoomStatus(result.status.value) }, {'readResult': result.isRead}]"></i>
                                        <p>
                                            <strong>{{result.id}}</strong><br />
                                            <span v-for="prof in result.professionals">{{ $t("labels.HotelName") }}: {{prof.businessName}}</span><br />
                                            <span v-for="asi in result.customForms">
                                                {{ $t("labels.Room") }}: {{asi.RoomorUnitNumber}}, {{ $t("labels.Guests") }}: {{result.contacts.length}}<br />
                                                {{ $t("labels.CheckIn") }}: {{ asi.StartDate + " "+ asi.CheckInTime | moment }}<br />
                                            </span>
   
                                     </div>
                                </div>
                            </span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="public/js/vue.min.js" type="text/javascript"></script>
    <script src="public/js/labels.js" type="text/javascript"></script>
    <script src="public/js/vue-i18n.min.js" type="text/javascript"></script>
    
    <script src="public/js/jquery.js" type="text/javascript"></script>
    <script src="public/js/jquery_print.js" type="text/javascript"></script>

    <script src="public/js/jquery.backstretch.js" type="text/javascript"></script>
    <script src="public/assets/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="public/js/moment.js" type="text/javascript"></script>
    <script src="public/js/detailPage.js" type="text/javascript"></script>
    <%--<script src="public/js/owl.carousel.min.js" type="text/javascript"></script>--%>
    
    <%--<script src="public/js/nav.js" type="text/javascript"></script>
    <script src="public/js/vegas.min.js" type="text/javascript"></script>
    <script src="public/js/waypoints.min.js" type="text/javascript"></script>
    <script src="public/js/counter.min.js" type="text/javascript"></script>--%>
    <%--<script src="public/js/main.js" type="text/javascript"></script>--%>
    
</body>
</html>
