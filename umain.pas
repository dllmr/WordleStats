unit uMain;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ComCtrls;

type

  { TfrmMain }

  TfrmMain = class(TForm)
    lblPlayed: TLabel;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    edtPlayed: TEdit;
    edt1: TEdit;
    edt2: TEdit;
    edt3: TEdit;
    edt4: TEdit;
    edt5: TEdit;
    edt6: TEdit;
    btnCalc: TButton;
    lblUnsolved: TLabel;
    lblWinPc: TLabel;
    lblMean: TLabel;
    lblRel4: TLabel;
    lblRatio34: TLabel;
    lblRatio35: TLabel;
    lblUnsolvedResult: TLabel;
    lblWinPcResult: TLabel;
    lblMeanResult: TLabel;
    lblRel4Result: TLabel;
    lblRatio34Result: TLabel;
    lblRatio35Result: TLabel;
    stbMain: TStatusBar;
    procedure btnCalcClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure lblUnsolvedResultClick(Sender: TObject);
    procedure lblWinPcResultClick(Sender: TObject);
    procedure lblMeanResultClick(Sender: TObject);
    procedure lblRel4ResultClick(Sender: TObject);
    procedure lblRatio34ResultClick(Sender: TObject);
    procedure lblRatio35ResultClick(Sender: TObject);
  private

  public

  end;

var
  frmMain: TfrmMain;

implementation

{$R *.lfm}

{ TfrmMain }

const
  HELP_DEFAULT = 'Click any result for details';
  HELP_UNSOLVED = 'Unsolved: games not solved within 6 guesses';
  HELP_WINPC = 'Win %: overall success rate';
  HELP_MEAN = 'Mean: average guesses per game (unsolved count as 7)';
  HELP_REL4 = 'Rel 4n: performance compared to always guessing in 4';
  HELP_RATIO34 = 'Ratio 3:4: compares number guessed in 3 vs 4';
  HELP_RATIO35 = 'Ratio 3:5: compares number guessed in 3 vs 5';

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  stbMain.Panels[0].Text := HELP_DEFAULT;
end;

procedure TfrmMain.lblUnsolvedResultClick(Sender: TObject);
begin
  stbMain.Panels[0].Text := HELP_UNSOLVED;
end;

procedure TfrmMain.lblWinPcResultClick(Sender: TObject);
begin
  stbMain.Panels[0].Text := HELP_WINPC;
end;

procedure TfrmMain.lblMeanResultClick(Sender: TObject);
begin
  stbMain.Panels[0].Text := HELP_MEAN;
end;

procedure TfrmMain.lblRel4ResultClick(Sender: TObject);
begin
  stbMain.Panels[0].Text := HELP_REL4;
end;

procedure TfrmMain.lblRatio34ResultClick(Sender: TObject);
begin
  stbMain.Panels[0].Text := HELP_RATIO34;
end;

procedure TfrmMain.lblRatio35ResultClick(Sender: TObject);
begin
  stbMain.Panels[0].Text := HELP_RATIO35;
end;

procedure TfrmMain.btnCalcClick(Sender: TObject);
var
  played, n1, n2, n3, n4, n5, n6, unsolved, totalGuesses: LongInt;
  validInputs: Boolean;
  winPercent, meanScore, ratio34, ratio35: Double;
begin
  played := StrToIntDef(edtPlayed.Text, 0);
  n1 := StrToIntDef(edt1.Text, 0);
  n2 := StrToIntDef(edt2.Text, 0);
  n3 := StrToIntDef(edt3.Text, 0);
  n4 := StrToIntDef(edt4.Text, 0);
  n5 := StrToIntDef(edt5.Text, 0);
  n6 := StrToIntDef(edt6.Text, 0);

  unsolved := played - n1 - n2 - n3 - n4 - n5 - n6;
  validInputs := (played > 0) and (n1 >= 0) and (n2 >= 0) and (n3 >= 0) and
              (n4 >= 0) and (n5 >= 0) and (n6 >= 0) and (unsolved >= 0);
  if (validInputs) then
  begin
    totalGuesses := n1 + n2*2 + n3*3 + n4*4 + n5*5 + n6*6 + unsolved*7;
    winPercent := 100.0 * (played - unsolved) / played;
    meanScore := totalGuesses / played;
    ratio34 := 1.0 * n3 / n4;
    ratio35 := 1.0 * n3 / n5;

    lblUnsolvedResult.Caption := IntToStr(unsolved);
    lblWinPcResult.Caption := FormatFloat('0.###', winPercent);
    lblMeanResult.Caption := FormatFloat('0.###', meanScore);
    lblRel4Result.Caption := IntToStr(totalGuesses - played*4);
    lblRatio34Result.Caption := FormatFloat('0.###', ratio34);
    lblRatio35Result.Caption := FormatFloat('0.###', ratio35);
  end
  else begin
    lblUnsolvedResult.Caption := '?';
    lblWinPcResult.Caption := '?';
    lblMeanResult.Caption := '?';
    lblRel4Result.Caption := '?';
    lblRatio34Result.Caption := '?';
    lblRatio35Result.Caption := '?';
  end;
end;

end.

