using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Web;

namespace TDCIDWebService.Accela
{
    [DataContract]
    public class CheckInSummary
    {
        [DataMember]
        public string id { get; set; }

        [DataMember]
        public string customId { get; set; }

        [DataMember]
        public AccelaInfoObject status { get; set; }

        [DataMember]
        public string openedDate { get; set; }

        [DataMember]
        public string description { get; set; }

        [DataMember]
        public List<AccelaCustomForm> customForms { get; set; }

        [DataMember]
        public List<AccelaProfessionals> professionals { get; set; }

        [DataMember]
        public List<AccelaContacts> contacts { get; set; }

    }

    [DataContract]
    public class AccelaInfoObject
    {
        [DataMember]
        public string value { get; set; }

        [DataMember]
        public string text { get; set; }
    }

    [DataContract]
    public class AccelaCustomForm
    {
        [DataMember]
        public string Bedrooms { get; set; }

        [DataMember]
        public string Fee { get; set; }

        [DataMember(Name = "Check In Type")]
        public string CheckInType { get; set; }

        [DataMember(Name = "Check Out Date")]
        public string CheckOutDate { get; set; }

        [DataMember(Name = "CC Type")]
        public string CCType { get; set; }

        [DataMember(Name = "Room or Unit Number")]
        public string RoomorUnitNumber { get; set; }

        [DataMember(Name = "Old Check In")]
        public string OldCheckIn { get; set; }

        [DataMember(Name = "Paid Amount")]
        public string PaidAmount { get; set; }

        [DataMember(Name = "CC Number")]
        public string CCNumber { get; set; }

        [DataMember(Name = "Check-in Time")]
        public string CheckInTime { get; set; }

        [DataMember(Name = "Total Nights Stayed")]
        public string TotalNightsStayed { get; set; }

        [DataMember]
        public string LPNumber { get; set; }

        [DataMember(Name = "Charge Extra")]
        public string ChargeExtra { get; set; }

        [DataMember(Name = "Payment Method")]
        public string PaymentMethod { get; set; }

        [DataMember(Name = "Total Fee")]
        public string TotalFee { get; set; }

        [DataMember(Name = "Exemption")]
        public string Exemption { get; set; }

        [DataMember(Name = "Nights Stayed")]
        public string NightsStayed { get; set; }

        [DataMember(Name = "Start Date")]
        public string StartDate { get; set; }

    }

    [DataContract]
    public class AccelaProfessionals
    {
        [DataMember]
        public string businessName { get; set; }

    }

    [DataContract]
    public class AccelaContacts
    {
        [DataMember]
        public string fullName { get; set; }

        [DataMember]
        public string firstName { get; set; }

        [DataMember]
        public string middleName { get; set; }

        [DataMember]
        public string lastName { get; set; }

        [DataMember]
        public string passportNumber { get; set; }

        [DataMember]
        public string stateIdNumber { get; set; }
    }
}