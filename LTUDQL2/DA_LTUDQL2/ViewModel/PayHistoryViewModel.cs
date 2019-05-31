using DA_LTUDQL2.Model;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Input;

namespace DA_LTUDQL2.ViewModel
{
    public class PayHistoryViewModel : BaseViewModel
    {
        private ObservableCollection<PayHistory> _List;
        public ObservableCollection<PayHistory> List { get => _List; set { _List = value; OnPropertyChanged(); } }

        private ObservableCollection<Model.KindVideo> _Kind;
        public ObservableCollection<Model.KindVideo> Kind { get => _Kind; set { _Kind = value; OnPropertyChanged(); } }

        private ObservableCollection<Model.User> _usr;
        public ObservableCollection<Model.User> Usr{ get =>_usr ; set { _usr = value; OnPropertyChanged(); } }


        private PayHistory _SelectedItem;
        //khi xét dữ liệu vào
        public PayHistory SelectedItem
        {
            get => _SelectedItem;
            set
            {
                //sau khi cập nhật dữ liệu xong
                _SelectedItem = value;
                OnPropertyChanged();
                //check null hay ko
                if (SelectedItem != null)
                {
                    //nếu ko, cập nhật 
                    Object = SelectedItem.Object.DisplayName;
                    User = SelectedItem.User.DisplayName;
                    Total = SelectedItem.Total.ToString();
                    Status = SelectedItem.Status;
                }
            }
        }
        private string _Object;
        public string Object { get => _Object; set { _Object = value; OnPropertyChanged(); } }

        private string _User;
        public string User { get => _User; set { _User = value; OnPropertyChanged(); } }

        private string _Total;
        public string Total { get => _Total; set { _Total = value; OnPropertyChanged(); } }

        private string _Status;
        public string Status { get => _Status; set { _Status = value; OnPropertyChanged(); } }

        public ICommand AddCommand { get; set; }
        public ICommand EditCommand { get; set; }



        //tạo public PayHistory để khi load lên sẽ cập nhật List
        public PayHistoryViewModel()
        {
            List = new ObservableCollection<Model.PayHistory>(DataProvider.Ins.DB.PayHistories);
            Kind = new ObservableCollection<Model.KindVideo>(DataProvider.Ins.DB.KindVideos);
            Usr = new ObservableCollection<Model.User>(DataProvider.Ins.DB.Users);
            //điều kiện add: displayname phải ko rỗng và chưa từng tồn tại trong dsach
            //điều kiện add: displayname phải ko rỗng và chưa từng tồn tại trong dsach

            //EditCommand = new RelayCommand<object>((p) =>
            //{
            //    if (SelectedItem == null)
            //        return false;

            //    var displayList = DataProvider.Ins.DB.PayHistories.Where(x => x.Id ==SelectedItem.Id);
            //    if (displayList == null || displayList.Count() != 0)
            //        return false;

            //    return true;

            //}, (p) => {

            //    var pay = DataProvider.Ins.DB.PayHistories.Where(x => x.Status == SelectedItem.Status).SingleOrDefault();
            //    //cập nhật db
            //    pay.Status=SelectedItem.Status;

            //    DataProvider.Ins.DB.SaveChanges();
                
            //    //
            //    var kindList = List.Where(x => x.Id == SelectedItem.Id).SingleOrDefault();
            //    //thông báo rằng List có sự thay đổi
            //    OnPropertyChanged("List");
            //});

        }
    }
}
