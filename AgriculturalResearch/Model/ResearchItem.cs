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
    
    public partial class ResearchItem
    {
        public ResearchItem()
        {
            this.ExpRecord = new HashSet<ExpRecord>();
            this.ItemPersonnel = new HashSet<ItemPersonnel>();
        }
    
        public int Id { get; set; }
        public Nullable<int> PersonId { get; set; }
        public string ItemName { get; set; }
        public string ItemType { get; set; }
        public string ItemCompany { get; set; }
        public string MajorPerson { get; set; }
        public string ItemPerson { get; set; }
        public string Tel { get; set; }
        public Nullable<decimal> Funds { get; set; }
        public Nullable<int> ExeYear { get; set; }
        public string UpFile { get; set; }
        public Nullable<System.DateTime> OperTime { get; set; }
        public string Approval { get; set; }
        public Nullable<System.DateTime> ApprovalTime { get; set; }
        public string State { get; set; }
    
        public virtual ICollection<ExpRecord> ExpRecord { get; set; }
        public virtual ICollection<ItemPersonnel> ItemPersonnel { get; set; }
        public virtual Person Person { get; set; }
    }
}