using System;
using System.Drawing;


namespace Draw.src.Model
{
    /// <summary>
    /// The Circle class is a base primitive that inherits from the base Shape.
    /// </summary>
    [Serializable]
    public class DoubleCrossedCircle : Shape
    {
        #region Constructor

        public DoubleCrossedCircle(RectangleF rect) : base(rect)
        {
        }

        public DoubleCrossedCircle(DoubleCrossedCircle rectangle) : base(rectangle)
        {
        }

        #endregion

        /// <summary>
        /// Checking whether a point belongs to the circle.
        /// In the case of a circle, this method may not be overridden because
        /// The implementation matches that of the abstract Shape class it checks for
        /// whether the point is in the element's bounding circle (and it matches
        /// the element in this case).
        /// </summary>
        public override bool Contains(PointF point)
        {
            if (base.Contains(point))
            {
                // Check if it is in the object only if the point is in the bounding circle.
                // In the case of a circle - we directly return true

                return true;
            }
            else
                // If it is not in the bounding circle, it cannot be in the object and => false
                return false;
        }

        /// <summary>
        /// The part visualising the specific primitive.
        /// </summary>
        public override void DrawSelf(Graphics grfx)
        {
            base.DrawSelf(grfx);

            grfx.FillEllipse(new SolidBrush(FillColor), Rectangle.X, Rectangle.Y, Rectangle.Width, Rectangle.Height);
            grfx.DrawEllipse(new Pen(StrokeColor), Rectangle.X, Rectangle.Y, Rectangle.Width, Rectangle.Height);

            grfx.DrawLine(new Pen(StrokeColor), Rectangle.X + 10, Rectangle.Y + 22, Rectangle.X + Rectangle.Width - 1, Rectangle.Y + Rectangle.Height - 44);
            grfx.DrawLine(new Pen(StrokeColor), Rectangle.X + 0, Rectangle.Y + 52, Rectangle.X + Rectangle.Width - 15, Rectangle.Y + Rectangle.Height - 14);
        }
    } // end of class DoubleCrossedCircle
}