//------------------------------------------------------------------------------
// <auto-generated>
//    此代码是根据模板生成的。
//
//    手动更改此文件可能会导致应用程序中发生异常行为。
//    如果重新生成代码，则将覆盖对此文件的手动更改。
// </auto-generated>
//------------------------------------------------------------------------------

namespace Model
{
    using System;
    using System.Collections.Generic;
    
    public partial class Achievements
    {
        public int Id { get; set; }
        public Nullable<int> PersonId { get; set; }
        public string AchTitle { get; set; }
        public string AchType { get; set; }
        public string AchContent { get; set; }
        public Nullable<System.DateTime> AchTime { get; set; }
        public string AchFile { get; set; }
        public string AchTel { get; set; }
        public string Honor { get; set; }
        public Nullable<System.DateTime> OperTime { get; set; }
        public string FileName { get; set; }
        public string State { get; set; }
    
        public virtual Person Person { get; set; }
    }
}
