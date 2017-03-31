using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(InfluenceWeb.Startup))]
namespace InfluenceWeb
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
