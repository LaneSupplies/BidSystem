using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using LaneBids.Models;
using WebMatrix.WebData;

namespace LaneBids.Sources
{
    public class UserServices
    {
        public static string ConvertUserId(int? userId)
        {
            if (userId != null)
            {
                var provider = (SimpleMembershipProvider)Membership.Provider;
                return provider.GetUserNameFromId((int)userId);
            }
            return "UserName";
        }
    }
}