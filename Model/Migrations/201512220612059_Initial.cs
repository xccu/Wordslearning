namespace Model.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class Initial : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.Words",
                c => new
                    {
                        WordId = c.Int(nullable: false, identity: true),
                        spell = c.String(maxLength: 50),
                        type = c.String(maxLength: 50),
                        speak = c.String(maxLength: 500),
                        translate = c.String(maxLength: 500),
                        sentence = c.String(),
                    })
                .PrimaryKey(t => t.WordId);
            
            CreateTable(
                "dbo.Spells",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        wordspell = c.String(maxLength: 50),
                    })
                .PrimaryKey(t => t.Id);
            
            CreateTable(
                "dbo.Users",
                c => new
                    {
                        UserId = c.Int(nullable: false, identity: true),
                        Name = c.String(),
                        Password = c.String(),
                        Age = c.Int(nullable: false),
                        Sex = c.String(),
                        Country = c.String(),
                        Imgurl = c.String(),
                        Power = c.Int(nullable: false),
                        Status = c.Int(nullable: false),
                    })
                .PrimaryKey(t => t.UserId);
            
            CreateTable(
                "dbo.Marks",
                c => new
                    {
                        MarkId = c.Int(nullable: false, identity: true),
                        UserId = c.Int(nullable: false),
                        WordId = c.Int(nullable: false),
                        Marked = c.Int(nullable: false),
                    })
                .PrimaryKey(t => t.MarkId)
                .ForeignKey("dbo.Users", t => t.UserId, cascadeDelete: true)
                .Index(t => t.UserId);
            
            CreateTable(
                "dbo.Pages",
                c => new
                    {
                        PageId = c.Int(nullable: false, identity: true),
                        PageName = c.String(),
                        ActionName = c.String(),
                        ControllerName = c.String(),
                        Power = c.Int(nullable: false),
                    })
                .PrimaryKey(t => t.PageId);
            
            CreateTable(
                "dbo.Scores",
                c => new
                    {
                        ScoreId = c.Int(nullable: false, identity: true),
                        UserId = c.Int(nullable: false),
                        SpellCount = c.Int(nullable: false),
                        FalseSpell = c.Int(nullable: false),
                        TransCount = c.Int(nullable: false),
                        FalseTrans = c.Int(nullable: false),
                        SCorrectRate = c.Single(nullable: false),
                        TCorrectRate = c.Single(nullable: false),
                        CorrectRate = c.Single(nullable: false),
                    })
                .PrimaryKey(t => t.ScoreId)
                .ForeignKey("dbo.Users", t => t.UserId, cascadeDelete: true)
                .Index(t => t.UserId);
            
            CreateTable(
                "dbo.Testeds",
                c => new
                    {
                        TestedId = c.Int(nullable: false, identity: true),
                        UserId = c.Int(),
                        WordId = c.Int(),
                        tag = c.Int(),
                    })
                .PrimaryKey(t => t.TestedId);
            
            CreateTable(
                "dbo.Musics",
                c => new
                    {
                        MusicId = c.Int(nullable: false, identity: true),
                        Name = c.String(),
                        Singer = c.String(),
                        Url = c.String(),
                        Lrc = c.String(),
                        Date = c.DateTime(nullable: false),
                    })
                .PrimaryKey(t => t.MusicId);
            
            CreateTable(
                "dbo.Readings",
                c => new
                    {
                        ReadingId = c.Int(nullable: false, identity: true),
                        Title = c.String(),
                        From = c.String(),
                        Url = c.String(),
                        Content = c.String(),
                        Date = c.DateTime(nullable: false),
                    })
                .PrimaryKey(t => t.ReadingId);
            
        }
        
        public override void Down()
        {
            DropIndex("dbo.Scores", new[] { "UserId" });
            DropIndex("dbo.Marks", new[] { "UserId" });
            DropForeignKey("dbo.Scores", "UserId", "dbo.Users");
            DropForeignKey("dbo.Marks", "UserId", "dbo.Users");
            DropTable("dbo.Readings");
            DropTable("dbo.Musics");
            DropTable("dbo.Testeds");
            DropTable("dbo.Scores");
            DropTable("dbo.Pages");
            DropTable("dbo.Marks");
            DropTable("dbo.Users");
            DropTable("dbo.Spells");
            DropTable("dbo.Words");
        }
    }
}
