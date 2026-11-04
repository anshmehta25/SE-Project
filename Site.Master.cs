using System;
using System.Web;
using System.Web.UI;

namespace SE_Project
{
    public partial class SiteMaster : MasterPage
    {
        public int CartCount { get; set; }
        public int WishlistCount { get; set; }
        public bool IsLoggedIn { get; set; }
        public bool IsAdmin { get; set; }
        public string UserName { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["action"] == "logout")
            {
                AuthHelper.SignOut();
                Response.Redirect("~/login.aspx?msg=loggedout");
                return;
            }

            IsLoggedIn = AuthHelper.IsLoggedIn();
            IsAdmin = AuthHelper.IsAdmin();
            UserName = AuthHelper.GetCurrentUserName();

            string cartKey = AuthHelper.GetCartUserKey();
            CartCount = DbHelper.GetCartCount(cartKey);
            WishlistCount = DbHelper.GetWishlistCount(cartKey);
        }
    }
}