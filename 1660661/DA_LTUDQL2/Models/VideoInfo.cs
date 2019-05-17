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
        public static readonly DependencyProperty DescriptionProperty;
        public static readonly DependencyProperty TrailerProperty;
        public static readonly DependencyProperty AvatarProperty;

        static VideoInfo()
        {
            TitleProperty = DependencyProperty.Register("Title", typeof(string), typeof(VideoInfo), new PropertyMetadata("New Video"));
            PathProperty = DependencyProperty.Register("Path", typeof(string), typeof(VideoInfo), new PropertyMetadata(@"New Video"));
            DescriptionProperty = DependencyProperty.Register("Decription", typeof(string), typeof(VideoInfo), new PropertyMetadata(@"New secription"));
            AvatarProperty = DependencyProperty.Register("Avatar", typeof(string), typeof(VideoInfo), new PropertyMetadata(@"E:\HoangTrung\LTUDQL2\LTUDQL2---DACK\1660661\01.png"));
            TrailerProperty = DependencyProperty.Register("Trailer", typeof(string), typeof(VideoInfo), new PropertyMetadata(@"E:\HoangTrung\LTUDQL2\LTUDQL2---DACK\1660661\01.mp4"));

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
        public string Description
        {
            get { return (string)GetValue(DescriptionProperty); }
            set { SetValue(DescriptionProperty, value); }
        }
        public string Avatar
        {
            get { return (string)GetValue(AvatarProperty); }
            set { SetValue(AvatarProperty, value); }
        }
        public string Trailer
        {
            get { return (string)GetValue(TrailerProperty); }
            set { SetValue(TrailerProperty, value); }
        }
    }
}
