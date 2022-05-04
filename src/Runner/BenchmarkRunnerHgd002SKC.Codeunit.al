codeunit 89320 "Benchmark Runner Hgd002SKC"
{
    TestIsolation = Codeunit;
    Subtype = TestRunner;

    trigger OnRun()
    var
        ScoreKeeper: Codeunit "ScoreKeeper Hgd";
        SessionId: Integer;
    begin
        ScoreKeeper.Start();
        Codeunit.Run(CODEUNIT::"Gonzalo findeset false002SKC");
        Codeunit.Run(CODEUNIT::"Gonzalo findeset true002SKC");
        ScoreKeeper.Done();
    end;
}