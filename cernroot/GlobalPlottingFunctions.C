namespace plotting {
// Draw and scp quickly with one function.
void SaveOpen(const std::string file = "plot.pdf", int nFiles = 1)
{
	assert(!file.empty()); // filename must not be empty
	if (gPad == NULL) { // check if pad for plot exists
		std::cerr << "No gPad object found for plot." << std::endl;
		return;
	}

	std::string file_base;
	{
		size_t dotPos = file.find_last_of(".");
		file_base = file.substr(0, dotPos);
		const std::string plotStr = "plot";
		if (file_base.substr(file_base.length() - plotStr.length(), plotStr.length()) != plotStr) {
			file_base += std::string("_") + plotStr;
		}
	}

	const std::string file_pdf = file_base + ".pdf";
	gPad->SaveAs(file_pdf.c_str()); // save plot as PDF

	//const std::string file_C = file_base + ".C";
	//gPad->SaveAs(file_C.c_str()); // save plot as script

	//const std::string file_ROOT = file_base + ".root";
	//gPad->SaveAs(file_ROOT.c_str()); // save plot in ROOT file

	// Open PDF plots locally.
	assert(nFiles > 0);
	if (nFiles == 1) {
		gSystem->Exec("openlatest");
	} else {
		TString cmd;
		cmd.Form("openlatest %i", nFiles);
		gSystem->Exec(cmd.Data());
	}

	return;
}

// Set logarithmic x-axis scale, and other aesthetic settings.
void SetLogX(const bool flag = true)
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

// Set linear x-axis scale, and other aesthetic settings.
void SetLinX(const bool flag = true)
{
  if (flag) {
    gStyle->SetLabelOffset(2.0/canvasHeight_pt, "x");
  } else {
    gStyle->SetLabelOffset(-0.8/canvasHeight_pt, "x");
  }
  gPad->UseCurrentStyle();
  gPad->SetLogy(yAxisIsLog);
  gPad->SetLogx(int(!flag));

  gPad->Modified();
  gPad->Update();

  xAxisIsLog = !flag;
}

// Set logarithmic y-axis scale, and other aesthetic settings.
void SetLogY(const bool flag = true)
{
  gPad->UseCurrentStyle();
  gPad->SetLogx(xAxisIsLog);
  gPad->SetLogy(int(flag));

  gPad->Modified();
  gPad->Update();

  yAxisIsLog = flag;
}

// Set linear y-axis scale, and other aesthetic settings.
void SetLinY(const bool flag = true)
{
  gPad->UseCurrentStyle();
  gPad->SetLogx(xAxisIsLog);
  gPad->SetLogy(int(!flag));

  gPad->Modified();
  gPad->Update();

  yAxisIsLog = !flag;
}

void SetPaletteAxis(TH1& hist, const TString& title = "A_{g}^{T} Log_{10} #sqrt{2} E_{pqyg} [unit]")
{
  gPad->Modified();
  gPad->Update();

  TPaletteAxis* axis = dynamic_cast<TPaletteAxis*>(hist.GetListOfFunctions()->FindObject("palette"));
  axis->SetX1NDC(0.935); axis->SetX2NDC(0.945);
  hist.GetZaxis()->SetTitleOffset(-0.40);
  hist.GetZaxis()->SetTitle(title);
  gPad->SetFrameLineWidth(10);

  gPad->Modified();
  gPad->Update();
}

class Colors {
public:
  Colors()
  {
    colors["blue_tableau"]   = TColor::GetColor("#1f77b4"); // Blue
    colors["orange_tableau"] = TColor::GetColor("#ff7f0e"); // Orange
    colors["green_tableau"]  = TColor::GetColor("#2ca02c"); // Green
    colors["red_tableau"]    = TColor::GetColor("#d62728"); // Red
    colors["purple_tableau"] = TColor::GetColor("#9467bd"); // Purple
    colors["brown_tableau"]  = TColor::GetColor("#8c564b"); // Brown
    colors["pink_tableau"]   = TColor::GetColor("#e377c2"); // Pink
    colors["gray_tableau"]   = TColor::GetColor("#8f7f7f"); // Gray
    colors["olive_tableau"]  = TColor::GetColor("#bcbd22"); // Olive
    colors["cyan_tableau"]   = TColor::GetColor("#17becf"); // Cyan
  }
int GetColor(const std::string& name)
{
  return colors.at(name);
}
int GetColor(int id = 0)
{
  int color = 0;
  int colorID = 0;
  for (std::map<std::string, int>::const_iterator i_color = colors.begin(); i_color != colors.end(); ++i_color) {
    if ((colorID % colors.size()) == id) {
      color = i_color->second;
      break;
    }
    ++colorID;
  }
  return color;
}

private:
  std::map<std::string, int> colors;
};
}
