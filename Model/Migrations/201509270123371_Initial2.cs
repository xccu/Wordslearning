namespace Model.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class Initial2 : DbMigration
    {
        public override void Up()
        {
            AlterColumn("dbo.Musics", "Name", c => c.String());
        }
        
        public override void Down()
        {
            AlterColumn("dbo.Musics", "Name", c => c.Int(nullable: false));
        }
    }
}
