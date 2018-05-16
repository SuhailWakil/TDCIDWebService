using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Web;

namespace TDCIDWebService.Accela
{
    
    [DataContract]
    public class CheckInDetail
    {
        [DataMember]
        public string recordId { get; set; }

        [DataMember]
        public string gender { get; set; }

        [DataMember]
        public string salutation { get; set; }

        [DataMember]
        public string birthRegion { get; set; }

        [DataMember]
        public string phone3 { get; set; }

        [DataMember]
        public string phone2 { get; set; }

        [DataMember]
        public string phone1 { get; set; }

        [DataMember]
        public string phone3CountryCode { get; set; }

        [DataMember]
        public string phone2CountryCode { get; set; }

        [DataMember]
        public string phone1CountryCode { get; set; }

        [DataMember]
        public string email { get; set; }

        [DataMember]
        public string fullName { get; set; }

        [DataMember]
        public string middleName { get; set; }

        [DataMember]
        public string lastName { get; set; }

        [DataMember]
        public string firstName { get; set; }

        [DataMember]
        public string title { get; set; }

        [DataMember]
        public string birthDate { get; set; }

        [DataMember]
        public string passportNumber { get; set; }

        [DataMember]
        public string stateIDNbr { get; set; }

        [DataMember]
        public string flag { get; set; }

        [DataMember(Name = "Arabic Name")]
        public string ArabicName { get; set; }

        [DataMember(Name = "Place of Birth")]
        public string PlaceofBirth { get; set; }

        [DataMember(Name = "Visit Purpose")]
        public string VisitPurpose { get; set; }

        [DataMember]
        public string nationality { get; set; }
        
        [DataMember]
        public List<AccelaDocuments> documents { get; set; }
    }

    [DataContract]
    public class AccelaDocuments
    {
        [DataMember]
        public List<DocImages> imageList { get; set; }

        [DataMember(Name = "Document Expiry Date")]
        public string DocumentExpiryDate { get; set; }
        
        [DataMember(Name = "Document Issued Date")]
        public string DocumentIssuedDate { get; set; }

        [DataMember(Name = "Document Number")]
        public string DocumentNumber { get; set; }

        [DataMember(Name = "Document Type")]
        public string DocumentType { get; set; }

        [DataMember(Name = "Issued Country")]
        public string IssuedCountry { get; set; }

        [DataMember(Name = "Reference Contact ID Number")]
        public string ReferenceContactIDNumber { get; set; }
        
    }

    [DataContract]
    public class DocImages
    {
        [DataMember]
        public string docNumber { get; set; }

        [DataMember]
        public int docSize { get; set; }
    }
}