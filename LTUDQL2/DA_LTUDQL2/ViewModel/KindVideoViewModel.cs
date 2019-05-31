using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Collections.ObjectModel;
using DA_LTUDQL2.Model;
using System.Windows.Input;

namespace DA_LTUDQL2.ViewModel
{
    public class KindVideoViewModel: BaseViewModel
    {
        private ObservableCollection<KindVideo> _List;
        public ObservableCollection<KindVideo> List { get => _List; set { _List = value;OnPropertyChanged(); } }

        private KindVideo _SelectedItem;
        //khi xét dữ liệu vào
        public KindVideo SelectedItem { get => _SelectedItem;
            set
            {
                //sau khi cập nhật dữ liệu xong
                _SelectedItem = value;
                OnPropertyChanged();
                //check null hay ko
                if (SelectedItem != null)
                {
                    //nếu ko, cập nhật DisplayName
                    DisplayName = SelectedItem.DisplayName;
                }
            }
        }

        private string _DisplayName;
        public string DisplayName { get => _DisplayName; set { _DisplayName = value; OnPropertyChanged(); } }


        public ICommand AddCommand { get; set; }
        public ICommand EditCommand { get; set; }
        //tạo public KindVieo để khi load lên sẽ cập nhật List
        public KindVideoViewModel()
        {
            List = new ObservableCollection<KindVideo>(DataProvider.Ins.DB.KindVideos);
            //điều kiện add: displayname phải ko rỗng và chưa từng tồn tại trong dsach
            AddCommand = new RelayCommand<object>((p) => 
            {
                if(string.IsNullOrEmpty(DisplayName))
                return false;

                var displayList = DataProvider.Ins.DB.KindVideos.Where(x => x.DisplayName == DisplayName);
                if (displayList == null || displayList.Count() != 0)
                    return false;

                return true;

            }, (p) => {
                // add mới vào
                //tạo biến để khi add xong hiển thị lên danh sách liền
                
                var kind = new KindVideo() { DisplayName = DisplayName };
                //cập nhật db
                DataProvider.Ins.DB.KindVideos.Add(kind);
                DataProvider.Ins.DB.SaveChanges();
                //đồng thời cũng cập nhật trên list
                List.Add(kind);
            });

            EditCommand = new RelayCommand<object>((p) =>
            {
                if (string.IsNullOrEmpty(DisplayName)||SelectedItem==null)
                    return false;

                var displayList = DataProvider.Ins.DB.KindVideos.Where(x => x.DisplayName == DisplayName);
                if (displayList == null || displayList.Count() != 0)
                    return false;

                return true;

            }, (p) => {

                var kind = DataProvider.Ins.DB.KindVideos.Where(x => x.Id == SelectedItem.Id).SingleOrDefault();
                //cập nhật db
                kind.DisplayName = DisplayName;
                DataProvider.Ins.DB.SaveChanges();

                SelectedItem.DisplayName = DisplayName;
                //
                var kindList = List.Where(x => x.Id == SelectedItem.Id).SingleOrDefault();
                //thông báo rằng List có sự thay đổi
                OnPropertyChanged("List");
            });
        }
    }
}
