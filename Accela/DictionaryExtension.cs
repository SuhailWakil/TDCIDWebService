using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TDCIDWebService.Accela
{
    public static class DictionaryExtension
    {
        public static Dictionary<string, object> RemoveNullAndWhiteSpaceValues(this Dictionary<string, object> dic)
        {
            return dic.Where(prop => {
                var val = prop.Value;

                if (val == null)
                {
                    return false;
                }

                if (val is string && string.IsNullOrWhiteSpace(val as string))
                {
                    return false;
                }
                return true;
            }).ToDictionary(prop => prop.Key, prop => prop.Value);
        }

    }
}