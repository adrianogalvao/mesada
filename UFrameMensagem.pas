unit UFrameMensagem;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Ani, FMX.Objects, FMX.Controls.Presentation, FMX.Layouts;

type
  TFrameMensagem = class(TFrame)
    MessageLabel: TLabel;
    BackgroundRectangle: TRectangle;
    ContentsLayout: TLayout;
    AniIndicator: TAniIndicator;
    pnTitulo: TPanel;
    lblTitulo: TLabel;
  private
    { Private declarations }
    function GetMessageText: string;
    procedure SetMessageText(const Value: string);
  public
    { Public declarations }
    procedure UpdateMessageText(const AText: string; const ASync: Boolean = True);

    property MessageText: string read GetMessageText write SetMessageText;
  end;

implementation

{$R *.fmx}

{ TWaitFrame }

function TFrameMensagem.GetMessageText: string;
begin
  Result := MessageLabel.Text;
end;

procedure TFrameMensagem.SetMessageText(const Value: string);
begin
  MessageLabel.Text := Value;
end;

procedure TFrameMensagem.UpdateMessageText(const AText: string; const ASync: Boolean);
begin
  pnTitulo.Visible := (lblTitulo.Text <> '');

  if not ASync then
    MessageText := AText
  else
    TThread.Synchronize(nil,
      procedure
      begin
        MessageText := AText;
      end
    );
end;

end.
