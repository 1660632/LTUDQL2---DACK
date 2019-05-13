using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;

namespace DA_LTUDQL2.Models
{
    public class VideoInfo : DependencyObject
    {
        public static readonly DependencyProperty TitleProperty;
        public static readonly DependencyProperty PathProperty;
        public static readonly DependencyProperty DecriptionProperty;

        static VideoInfo()
        {
            TitleProperty = DependencyProperty.Register("Title", typeof(string), typeof(VideoInfo), new PropertyMetadata("New Video"));
            PathProperty = DependencyProperty.Register("Path", typeof(string), typeof(VideoInfo), new PropertyMetadata(@"E:\HoangTrung\LTUDQL2\DemoTuan10\01.mp4"));
            DecriptionProperty = DependencyProperty.Register("Decription", typeof(string), typeof(VideoInfo), new PropertyMetadata(@"New secription"));


        }
        public string Title
        {
            get { return (string)GetValue(TitleProperty); }
            set { SetValue(TitleProperty, value); }
        }
        public string Path
        {
            get { return (string)GetValue(PathProperty); }
            set { SetValue(PathProperty, value); }
        }
        public string Decription
        {
            get { return (string)GetValue(DecriptionProperty); }
            set { SetValue(DecriptionProperty, value); }
        }
    }
}
