using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MyLib.Math;
using MyLib.Geometry;
namespace Helloword
{
    class Program
    {
        
            static void Main(string[] args)
        {
            List<Shape> ListShape = new List<Shape>();
            ListShape.Add(new Circle(5, 5, 10));
            ListShape.Add(new Rectangle());
            foreach (var item in ListShape)
            {
                Console.WriteLine(item.ToString());
            }
            Console.ReadKey();
        }
    }
}
