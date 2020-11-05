using MyLib.Math;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MyLib.Geometry
{
    public class Circle : Shape
    {
        public Point CenterPoint { set; get; }
        public double Radius { set; get; }
        public Circle()
        {
            CenterPoint = new Point();
            Radius = 0;
        }
        public Circle(int x, int y, int r)
        {
            CenterPoint = new Point(x, y);
            Radius = r;
        }
        public Circle(Point p, int r)
        {
            CenterPoint = new Point(p);
            Radius = r;
        }
        public Circle(Circle c)
        {
            CenterPoint = new Point(c.CenterPoint);
            Radius = c.Radius;
        }
        public double Perimeter()
        {
            return 2 * System.Math.PI * Radius;
        }
        public double Area()
        {
            return System.Math.PI * System.Math.Pow(Radius, 2);
        }

        /// <summary>
        /// Xác định vị trí tương đối giữa 2 hình tròn 
        /// </summary>
        /// <param name="c2">Hình tròn cần xác định vị trí với hình hiện tại</param>
        /// <returns>
        /// 0: lying outside (nằm ngoài)
        /// 1: Touching externally (giao nhau ở ngoài)
        /// 2: Touching internally (giao nhau ở trong)
        /// 3: One lying inside other (nằm ở trong)
        /// 4: Intersecting at two point (cắt nhau)
        /// </returns>
        public RELATIVECIRCLE RelativePosition(Circle c2)
        {
            double c1c2 = CenterPoint.Distance(c2.CenterPoint);
            double r1Cr2 = Radius + c2.Radius;
            double r1Tr2 = System.Math.Abs(Radius - c2.Radius);
            if (c1c2 > Radius + c2.Radius)
                return RELATIVECIRCLE.lyingOutside;
            if (c1c2 == r1Cr2)
                return RELATIVECIRCLE.TouchingExternally;
            if (c1c2 == r1Tr2)
                return RELATIVECIRCLE.TouchingInternally;
            if (c1c2 < r1Tr2)
                return RELATIVECIRCLE.OneLyingInsideOther;
            return RELATIVECIRCLE.IntersectingAtTwoPoint;
        }

        public override double Perimeter()
        {
            throw new NotImplementedException();
        }

        public override double Area()
        {
            throw new NotImplementedException();
        }
    }

    public enum RELATIVECIRCLE
    {
        lyingOutside,
        TouchingExternally,
        TouchingInternally,
        OneLyingInsideOther,
        IntersectingAtTwoPoint,
    }
}
