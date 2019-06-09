unit UFMenu;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Layouts, FMX.ExtCtrls, System.Math.Vectors, FMX.StdCtrls, FMX.Controls3D,
  FMX.Layers3D, FMX.Controls.Presentation, FrameStand;

type
  TFMenu = class(TForm)
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    Image6: TImage;
    Image7: TImage;
    Image8: TImage;
    FrameStand: TFrameStand;
    Image1: TImage;
    procedure Image5Click(Sender: TObject);
    procedure Image6Click(Sender: TObject);
    procedure Image7Click(Sender: TObject);
    procedure Image8Click(Sender: TObject);
    procedure Image1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMenu: TFMenu;

implementation

{$R *.fmx}

uses UFrameMensagem, UFDialog;
{$R *.LgXhdpiPh.fmx ANDROID}
{$R *.iPhone55in.fmx IOS}

procedure TFMenu.Image1Click(Sender: TObject);
begin
  FDialog := TFDialog.Create(Self);
  FDialog.lblTitulo.Text := 'Estudar';
  FDialog.mmMsg.Lines.Clear;
  FDialog.mmMsg.Lines.Add('Seu per�odo de estudos � de 3 horas.');
  FDialog.mmMsg.Lines.Add('Seu objetivo � tirar 9 em matem�tica.');
  FDialog.mmMsg.Lines.Add('Iniciando a tarefa: ' + TimeToStr(now));
  FDialog.mmMsg.Lines.Add('Iniciar tarefa?');
  FDialog.Show;
end;

procedure TFMenu.Image5Click(Sender: TObject);
begin
  FrameStand.New<TFrameMensagem>(FMenu).Show(
    procedure(AFrameInfo: TFrameInfo<TFrameMensagem>)
    begin
      AFrameInfo.Frame.AniIndicator.Enabled := True;
      try
        AFrameInfo.Frame.UpdateMessageText('Est� tarefa j� est� liberada...');
        Sleep(3000);
      except
        AFrameInfo.Frame.UpdateMessageText('Erro ao Carregar as Mesas.');
        Sleep(1000);
      end;
    end
    , // On background task completion, hide the wait frame
    procedure(AFrameInfo: TFrameInfo<TFrameMensagem>)
    begin
      AFrameInfo.Hide;
      AFrameInfo.Close;
      FreeAndNil(AFrameInfo);
    end
  );
end;

procedure TFMenu.Image6Click(Sender: TObject);
begin
  FrameStand.New<TFrameMensagem>(FMenu).Show(
    procedure(AFrameInfo: TFrameInfo<TFrameMensagem>)
    begin
      AFrameInfo.Frame.AniIndicator.Enabled := True;
      try
        AFrameInfo.Frame.UpdateMessageText('Est� tarefa est� aguardando o aceite...');
        Sleep(3000);
      except
        AFrameInfo.Frame.UpdateMessageText('Erro ao Carregar as Mesas.');
        Sleep(1000);
      end;
    end
    , // On background task completion, hide the wait frame
    procedure(AFrameInfo: TFrameInfo<TFrameMensagem>)
    begin
      AFrameInfo.Hide;
      AFrameInfo.Close;
      FreeAndNil(AFrameInfo);
    end
  );
end;

procedure TFMenu.Image7Click(Sender: TObject);
begin
  FDialog := TFDialog.Create(Self);
  FDialog.lblTitulo.Text := 'Esporte';
  FDialog.mmMsg.Lines.Clear;
  FDialog.mmMsg.Lines.Add('Seu per�odo de exerc�cio � de 1 hora.');
  FDialog.mmMsg.Lines.Add('Seu objetivo � manter a boa forma.');
  FDialog.mmMsg.Lines.Add('Iniciando a tarefa: ' + TimeToStr(now));
  FDialog.mmMsg.Lines.Add('Iniciar tarefa?');
  FDialog.Show;
end;

procedure TFMenu.Image8Click(Sender: TObject);
begin
  FDialog := TFDialog.Create(Self);
  FDialog.lblTitulo.Text := 'Game';
  FDialog.mmMsg.Lines.Clear;
  FDialog.mmMsg.Lines.Add('Seu per�odo m�ximo de jogo � de 1 hora.');
  FDialog.mmMsg.Lines.Add('Seu objetivo � diminuir o tempo jogando.');
  FDialog.mmMsg.Lines.Add('Iniciando a tarefa: ' + TimeToStr(now));
  FDialog.mmMsg.Lines.Add('Iniciar tarefa?');
  FDialog.Show;
end;

end.
