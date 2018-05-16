using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Web;

namespace TDCIDWebService.Accela
{
    public class LP
    {
        [DataMember]
        public string businessLicense { get; set; }

        [DataMember]
        public string licenseNumber { get; set; }

        [DataMember]
        public string businessName { get; set; }

    }
}