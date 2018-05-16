<!DOCTYPE html>
<html lang="fr"><head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>CID</title>

<!--[if lt IE 9]>
<script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
<![endif]-->

<!-- Fichiers CSS -->
<link rel="stylesheet" href="public/assets/printable/reset.css">
<!--[if lt IE 9]> 
	<link rel="stylesheet" href="css/cv.css" media="screen">
<![endif]-->
<link rel="stylesheet" media="screen and (max-width:480px)" href="public/assets/printable/mobile.css">
<link rel="stylesheet" media="screen and (min-width:481px)" href="public/assets/printable/cv.css">
<link rel="stylesheet" media="print" href="public/assets/printable/cv.css">
</head>

<body dir="rtl">
<div id="printable">
	<section role="main" class="container_16">
	        <!-- CheckIn -->
			<div class="grid_16">
				<h4><strong>{{ $t("labels.CheckInDetails") }}</strong></h4>
			    <div class="grid_8">
                    <span v-for="asi in selectedResult.customForms">
				        <strong>{{ $t("labels.RoomNumber") }}: </strong>{{asi.RoomorUnitNumber}}<br>
                        <strong>{{ $t("labels.Bedrooms") }}: </strong>{{asi.Bedrooms}}<br>
                        <strong>{{ $t("labels.CardNumber") }}: </strong>{{asi.CCNumber}}<br>
                        <strong>{{ $t("labels.CheckInType") }}: </strong>{{asi.CheckInType}}<br>
                        <strong>{{ $t("labels.OldCheckInID") }}: </strong>{{asi.OldCheckIn}}<br>
                    </span>
			    </div>
			   <div class="grid_8">
				    <strong>{{ $t("labels.AccelaRef") }}:</strong>  {{selectedResult.id}}<br> 
                    <span v-for="prof in selectedResult.professionals">
                        <strong>{{ $t("labels.HotelName") }}:</strong> {{prof.businessName}} <br>
                    </span>
                    <span v-for="asi in selectedResult.customForms">
				        <strong>{{ $t("labels.CheckIn") }}:</strong> {{ asi.StartDate + " "+ asi.CheckInTime | moment }} <br>
                        <strong>{{ $t("labels.CheckOut") }}:</strong> {{ asi.CheckOutDate + " "+ asi.CheckOutTime | momentMod }}<br>
                        <strong>{{ $t("labels.CreditCardType") }}: </strong> {{asi.CCType}} <br>
                        <strong>{{ $t("labels.PaymentMethod") }}:</strong> {{asi.PaymentMethod}}<br>
                    </span>
			    </div>
			</div>
		
			<!-- Guest -->
			<span class="grid_16" v-for="detail in details" clearfix>
                    <h4><strong>{{ $t("labels.GuestDetails") }} - {{detail.salutation}}</strong></h4>
				    <div class="grid_8">
				        <strong>{{ $t("labels.ResidenceCountry") }}: </strong>{{detail.birthRegion}}<br>
                        <strong>{{ $t("labels.ResidencyPhone") }}: </strong>{{detail.phone1CountryCode}} {{detail.phone1}}<br>
                        <strong>{{ $t("labels.FullName") }}: </strong>{{detail.fullName}}<br>
                        <strong>{{ $t("labels.BirthDate") }}: </strong>{{detail.birthDate | momentMod}}<br>
                        <strong>{{ $t("labels.BirthPlace") }}: </strong>{{detail.PlaceofBirth}}<br>
                        <span id="Documents" v-for="document in detail.documents">
                            <strong>{{ $t("labels.DocumentType") }}: </strong>{{document.DocumentType}}<br>
                            <strong>{{ $t("labels.IssuedCountry") }}: </strong>{{document.IssuedCountry}}<br>
                            <strong>{{ $t("labels.DocumentIssuedDate") }}: </strong>{{document.DocumentIssuedDate | momentMod}}<br>
                            <strong>{{ $t("labels.DocumentExpireDate") }}: </strong>{{document.DocumentExpiryDate | momentMod}}<br>
                        </span>
			        </div>    
                
                    <div class="grid_8">
				        <strong>{{ $t("labels.FirstName") }}: </strong>{{detail.firstName}}<br>
                        <strong>{{ $t("labels.ArabicName") }}: </strong>{{detail.ArabicName}}<br>
                        <strong>{{ $t("labels.VisitPurpose") }}: </strong>{{detail.VisitPurpose}}<br>
                        <strong>{{ $t("labels.Passport") }}: </strong>{{detail.passportNumber}}<br>
                        <strong>{{ $t("labels.Email") }}: </strong>{{detail.email}}<br>
                        <strong>{{ $t("labels.Phone") }}: </strong>{{detail.phone2CountryCode}} {{detail.phone2}}<br>
                        <strong>{{ $t("labels.LastName") }}: </strong>{{detail.lastName}}<br>
                        <strong>{{ $t("labels.IDNumber") }}: </strong>{{detail.stateIDNbr}}<br>
                        <strong>{{ $t("labels.Nationality") }}: </strong>{{detail.nationality}}<br>
                        <strong>{{ $t("labels.AdditionalPhone") }}: </strong>{{detail.phone3CountryCode}} {{detail.phone3}}<br>
			        </div>
			
			        
                    <span class="grid_16" v-for="document in detail.documents">
                        <span v-for="image in document.imageList">
                            <div class="grid_16">
                                <img class="img-responsive" v-bind:src="'TDWebService.asmx/getImage?documentId=' + image.docNumber + '&length=' + image.docSize + '&token='+token+''" />
                            </div>
                        </span>
                    </span>
            </span>
	</section>
</div> 

<script src="public/js/vue.min.js" type="text/javascript"></script>
<script src="public/js/labels.js" type="text/javascript"></script>
<script src="public/js/vue-i18n.min.js" type="text/javascript"></script>

<script src="public/js/moment.js" type="text/javascript"></script>
<script src="public/assets/printable/print.js"></script>
<!-- Scripts JavaScript -->
<script src="public/assets/printable/jquery-1.js"></script>
<script src="public/assets/printable/validate.js"></script>

<!--[if lt IE 9]>
<script src="scripts/placeholder.js"></script>
<![endif]-->
<script src="public/assets/printable/plugins.js"></script>
<script src="public/js/moment.js" type="text/javascript"></script>



</body></html>