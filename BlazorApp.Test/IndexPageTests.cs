using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Xunit;
using BlazorApp.Pages;
using Bunit;

namespace BlazorApp.Test
{
    public class IndexPageTests: TestContext
    {
        [Fact]
        public void IndexPage_HasCorrectTitle()
        {
            // Renderizar el componente Index
            var cut = RenderComponent<BlazorApp.Pages.Index>();

            // Comprobar si el título contiene "Hola mundo loco"
            cut.MarkupMatches("<h1>Hola mundo loco</h1>");
        }
    }
}
