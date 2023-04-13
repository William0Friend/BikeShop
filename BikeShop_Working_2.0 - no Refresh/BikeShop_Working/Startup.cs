using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(BikeShop_Working.Startup))]
namespace BikeShop_Working
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
