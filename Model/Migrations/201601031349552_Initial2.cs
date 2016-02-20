namespace Model.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class Initial2 : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.WordLibraries",
                c => new
                    {
                        WordLibraryId = c.Int(nullable: false, identity: true),
                        LibraryId = c.Int(nullable: false),
                        WordId = c.Int(nullable: false),
                    })
                .PrimaryKey(t => t.WordLibraryId)
                .ForeignKey("dbo.Words", t => t.WordId, cascadeDelete: true)
                .ForeignKey("dbo.Libraries", t => t.LibraryId, cascadeDelete: true)
                .Index(t => t.WordId)
                .Index(t => t.LibraryId);
            
            CreateTable(
                "dbo.Libraries",
                c => new
                    {
                        LibraryId = c.Int(nullable: false, identity: true),
                        LibraryName = c.String(),
                    })
                .PrimaryKey(t => t.LibraryId);
            
        }
        
        public override void Down()
        {
            DropIndex("dbo.WordLibraries", new[] { "LibraryId" });
            DropIndex("dbo.WordLibraries", new[] { "WordId" });
            DropForeignKey("dbo.WordLibraries", "LibraryId", "dbo.Libraries");
            DropForeignKey("dbo.WordLibraries", "WordId", "dbo.Words");
            DropTable("dbo.Libraries");
            DropTable("dbo.WordLibraries");
        }
    }
}
