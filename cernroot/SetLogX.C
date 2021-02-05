void SetLogX(const bool flag = true) // Set logarithmic x-axis scale, and other aesthetic settings
{
  if (flag) {
    gStyle->SetLabelOffset(-0.8/canvasHeight_pt, "x");
  } else {
    gStyle->SetLabelOffset(2.0/canvasHeight_pt, "x");
  }
  gPad->UseCurrentStyle();
  gPad->SetLogy(yAxisIsLog);
  gPad->SetLogx(int(flag));

  gPad->Modified();
  gPad->Update();

  xAxisIsLog = flag;
}
