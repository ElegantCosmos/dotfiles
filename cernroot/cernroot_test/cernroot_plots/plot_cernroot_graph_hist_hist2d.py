#!/usr/bin/env python3

import array as arr
import ROOT as rt

rt.publicationStyle.ApplyStyle()
palette = rt.publicationStyle.Palette("tableau_10")


c0 = rt.TCanvas("c0", "c0")
xs = arr.array('d', (-1000, -500, 0, 500, 1000))
ys = arr.array('d', (-1000, -500, 0, 500, 1000))
graph = rt.TGraph(len(xs), xs, ys)
graph.Draw("ALP")
#graph.SetLineColor(palette.GetColor("blue"))
#graph.SetMarkerColor(palette.GetColor("blue"))
graph.GetXaxis().SetTitle("A_{g}^{T} [cm] #sqrt{2} Log_{10}/E_{pqyg}")
graph.GetYaxis().SetTitle("A_{g}^{T} [A.U.] #sqrt{2} Log_{10}/E_{pqyg}")
graph.GetXaxis().SetLimits(-1000, 1000)
#graph.SetMaximum(1000)
#graph.SetMinimum(-1000)
graph.GetYaxis().SetRangeUser(-1000, 1000) # also works
#rt.publicationStyle.SetLogX(graph)
#rt.publicationStyle.SetLogY(graph)
rt.publicationStyle.FormatAxes(graph)
rt.gPad.Update()
rt.gPad.SaveAs("cernpyroot_graph.pdf")


c1 = rt.TCanvas("c1", "c1")
hist = rt.TH1F("hist", "hist", 10, 0, 1e4)
hist.Fill(0)
hist.Fill(5e3, 1e3)
hist.Fill(9e3, 1e3)
hist.Draw()
hist.SetLineColor(palette.GetColor("orange"))
hist.SetMarkerColor(palette.GetColor("orange"))
hist.GetXaxis().SetTitle("A_{g}^{T}  Log_{10}/E_{pqyg} [cm] #sqrt{2}")
hist.GetYaxis().SetTitle("A_{g}^{T}  Log_{10}/E_{pqyg} [A.U.] #sqrt{2}")
#cout << "gPad.GetWw()" << gPad.GetWw() << endl
#cout << "gPad.GetWh()" << gPad.GetWh() << endl
#hist.GetXaxis().SetRangeUser(50e27, 400e27)
#hist.GetYaxis().SetRangeUser(-1e30, 3e30)
#hist.SetMaximum(3e30)
#hist.SetMinimum(-1e30)
#rt.publicationStyle.SetLogX(hist)
rt.publicationStyle.FormatAxes(hist)
rt.gPad.Update()
rt.gPad.SaveAs("cernpyroot_hist.pdf")


c2 = rt.TCanvas("c2", "c2")
rt.gStyle.SetOptStat("")
hist2 = rt.TH2F("hist2", "hist2", 10, -800, 800, 10, -800, 800)
hist2.Fill(10, 50, 0)
hist2.Fill(-10, 60, 100)
hist2.Fill(70, 70, 750)
hist2.Draw("Colz")
hist2.GetXaxis().SetTitle("A_{g}^{T}  Log_{10}/E_{pqyg} [cm] #sqrt{2}")
hist2.GetYaxis().SetTitle("A_{g}^{T}  Log_{10}/E_{pqyg} [A.U.] #sqrt{2}")
#rt.publicationStyle.FormatPaletteAxis(hist2)
#hist2.GetXaxis().SetRangeUser(10, 90)
#hist2.GetYaxis().SetRangeUser(10, 80)
#rt.publicationStyle.SetLogY(hist2)
#rt.publicationStyle.SetLogX(hist2)
rt.publicationStyle.FormatAxes(hist2)
rt.publicationStyle.FormatPaletteAxis(hist2)
rt.gPad.SetLogz()
rt.gPad.Update()
rt.gPad.SaveAs("cernpyroot_hist2d.pdf")
#gPad.SaveAs("cernpyroot_hist2d.png")
#gPad.SaveAs("cernpyroot_hist2d.tex")
