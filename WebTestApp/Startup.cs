using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(WebTestApp.Startup))]
namespace WebTestApp
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
