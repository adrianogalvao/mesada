unit UFDialog;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.ScrollBox, FMX.Memo;

type
  TFDialog = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    ToolBar1: TToolBar;
    btnIniciar: TButton;
    ToolBar2: TToolBar;
    lblTitulo: TLabel;
    mmMsg: TMemo;
    procedure btnIniciarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FDialog: TFDialog;

implementation

{$R *.fmx}

procedure TFDialog.btnIniciarClick(Sender: TObject);
begin
  ModalResult := mrOk;
  Self.Close;
end;

end.
