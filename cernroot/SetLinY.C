void SetLinY(const bool flag = true) // Set linear y-axis scale, and other aesthetic settings
{
  gPad->UseCurrentStyle();
  gPad->SetLogx(xAxisIsLog);
  gPad->SetLogy(int(!flag));

  gPad->Modified();
  gPad->Update();

  yAxisIsLog = !flag;
}
