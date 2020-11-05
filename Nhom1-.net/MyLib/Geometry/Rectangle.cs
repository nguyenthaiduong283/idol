using MyLib.Math;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MyLib.Geometry
{
    public class Rectangle : Shape
    {
        public Point LeftBottomPoint { get; set; }
        public Point RightBottomPoint { get; set; }
        public override double Area()
        {
            throw new NotImplementedException();
        }
        public override double Perimeter()
        {
            throw new NotImplementedException();
        }
        public override string ToString()
        {
            return "tôi là hình chữ nhật";
        }
    }
}
