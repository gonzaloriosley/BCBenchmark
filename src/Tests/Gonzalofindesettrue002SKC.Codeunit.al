codeunit 89328 "Gonzalo findeset true002SKC"
{
    Subtype = Test;

    trigger OnRun()
    var
        StartTime: Time;
        Score: Integer;
        RunTime: Duration;
    begin
        RunTime := 10000;
        StartTime := Time();
        repeat
            RunSingleTest();
            Score += 1;
        until Time() - StartTime > RunTime;
        ScoreKeeper.Add(Codeunit::"Gonzalo findeset true002SKC", Score);
    end;

    [MessageHandler]
    procedure MessageHandler(Msg: Text[1024])
    begin

    end;

    [Test]
    procedure RunSingleTest()
    var
        Customer: Record Customer;
    begin
        if Customer.FindSet(true) then
            repeat
                Customer."Country/Region Code" := 'PT';
                Customer.Modify();
            until Customer.Next() = 0;
    end;

    var
        ScoreKeeper: Codeunit "ScoreKeeper Hgd";
}