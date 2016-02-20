namespace Model.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class Initial2 : DbMigration
    {
        public override void Up()
        {
            AlterColumn("dbo.Words", "spell", c => c.String());
            AlterColumn("dbo.Words", "type", c => c.String());
            AlterColumn("dbo.Words", "speak", c => c.String());
            AlterColumn("dbo.Words", "translate", c => c.String());
            AddForeignKey("dbo.Testeds", "WordId", "dbo.Words", "WordId");
            AddForeignKey("dbo.Testeds", "UserId", "dbo.Users", "UserId");
            CreateIndex("dbo.Testeds", "WordId");
            CreateIndex("dbo.Testeds", "UserId");
        }
        
        public override void Down()
        {
            DropIndex("dbo.Testeds", new[] { "UserId" });
            DropIndex("dbo.Testeds", new[] { "WordId" });
            DropForeignKey("dbo.Testeds", "UserId", "dbo.Users");
            DropForeignKey("dbo.Testeds", "WordId", "dbo.Words");
            AlterColumn("dbo.Words", "translate", c => c.String(maxLength: 500));
            AlterColumn("dbo.Words", "speak", c => c.String(maxLength: 500));
            AlterColumn("dbo.Words", "type", c => c.String(maxLength: 50));
            AlterColumn("dbo.Words", "spell", c => c.String(maxLength: 50));
        }
    }
}
