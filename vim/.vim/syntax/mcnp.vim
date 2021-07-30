" Vim syntax file
" Language: MCNP Input File
" Version: 1.1.0
" Maintainer: Joel A. Kulesza <jkulesza@lanl.gov>
" Creator: Joel A. Kulesza <jkulesza@lanl.gov>
" Latest Revision: 01 December 2020
" First Revision: 05 June 2017
"
" Credits:
" Copyright (c) 2020 Triad National Security, LLC.  All rights reserved.
"
" This material was produced under U.S. Government contract 89233218NCA000001
" for Los Alamos National Laboratory, which is operated by Triad National
" Security, LLC for the U.S. Department of Energy.  The Government is granted
" for itself and others acting on its behalf a paid-up, nonexclusive,
" irrevocable worldwide license in this material to reproduce, prepare
" derivative works, and perform publicly and display publicly.  Beginning five
" (5) years after February 14, 2018, subject to additional five-year worldwide
" renewals, the Government is granted for itself and others acting on its behalf
" a paid-up, nonexclusive, irrevocable worldwide license in this material to
" reproduce, prepare derivative works, distribute copies to the public, perform
" publicly and display publicly, and to permit others to do so.  NEITHER THE
" UNITED STATES NOR THE UNITED STATES DEPARTMENT OF ENERGY, NOR TRIAD NATIONAL
" SECURITY, LLC, NOR ANY OF THEIR EMPLOYEES, MAKES ANY WARRANTY, EXPRESS OR
" IMPLIED, OR ASSUMES ANY LEGAL LIABILITY OR RESPONSIBILITY FOR THE ACCURACY,
" COMPLETENESS, OR USEFULNESS OF ANY INFORMATION, APPARATUS, PRODUCT, OR PROCESS
" DISCLOSED, OR REPRESENTS THAT ITS USE WOULD NOT INFRINGE PRIVATELY OWNED
" RIGHTS.

if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

syntax case ignore

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Preliminaries.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Title card.
syn match mcnpTitle "\%1l.*$"

" Comments.
syn match mcnpComment "^\s\{0,4}c\s.*$"
syn match mcnpComment "^\s\{0,4}c$"
syn match mcnpComment "$.*$"

" Constants and operators.
syn match mcnpConstant "\d*j"
syn match mcnpOperator "="
syn match mcnpOperator "("
syn match mcnpOperator ")"

syn match mcnpOperator ":"
syn match mcnpVariable "d\d\+"
syn match mcnpOperator "#"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Cell keywords.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syn keyword mcnpKeyword like but
syn match mcnpKeyword "mat"
syn match mcnpKeyword "rho"
syn match mcnpKeyword "imp"
syn match mcnpKeyword "vol"
syn match mcnpKeyword "pwt"
syn match mcnpKeyword "ext"
syn match mcnpKeyword "fcl"
syn match mcnpKeyword "wwn"
syn match mcnpKeyword "dxc"
syn match mcnpKeyword "nonu"
syn match mcnpKeyword "pd"
syn match mcnpKeyword "tmp"
syn match mcnpKeyword "trcl"
syn match mcnpKeyword "fill"
syn match mcnpKeyword "elpt"
syn match mcnpKeyword "cosy"
syn match mcnpKeyword "bflcl"
syn match mcnpKeyword "unc"
syn match mcnpKeyword " u"
syn match mcnpKeyword "lat"

syn match mcnpCard "^\s\{0,4}u"
syn match mcnpCard "^\s\{0,4}lat"
syn keyword mcnpCard uran

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Surface keywords.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syn keyword mcnpKeyword p px py pz so s sx sy sz cx cy cz kx ky kz sq gq tx ty tz xyzp
syn match mcnpKeyword "c\/x"
syn match mcnpKeyword "c\/y"
syn match mcnpKeyword "c\/z"
syn match mcnpKeyword "k\/x"
syn match mcnpKeyword "k\/y"
syn match mcnpKeyword "k\/z"
syn keyword mcnpKeyword box rpp sph rcc rhp hex rec trc ell wed arb

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Data keywords.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Geometry data cards.
syn match mcnpCard "^\s\{0,4}vol"
syn match mcnpCard "^\s\{0,4}area"
syn match mcnpCard "^\s\{0,4}\**trcl"
syn match mcnpCard "^\s\{0,4}\**tr\d\+"

" Mesh geometry data cards.
syn match mcnpCard "^\s\{0,4}mesh"
syn keyword mcnpKeyword geom ref origin axs vec imesh iints jmesh jints kmesh kints

syn match mcnpCard "^\s\{0,4}dm"
syn match mcnpCard "^\s\{0,4}dawwg"

syn match mcnpKeyword "embed"
syn match mcnpCard "^\s\{0,4}embed\d\+"
syn keyword mcnpKeyword background matcell meshgeo mgeoin meeout meein calc_vols filetype gmvfile length mcnpumfile overlap
syn keyword mcnpConstant yes no lnk3dnt abaqus mcnpum ascii binary exit entry average

syn match mcnpCard "^\s\{0,4}embee\d\+"
syn keyword mcnpKeyword energy time atom factor list mat mtype
syn keyword mcnpConstant flux isotopic population reaction source tracks

syn match mcnpCard "^\s\{0,4}embeb"
syn match mcnpCard "^\s\{0,4}embem"
syn match mcnpCard "^\s\{0,4}embtb"
syn match mcnpCard "^\s\{0,4}embtm"
syn match mcnpCard "^\s\{0,4}embde"
syn match mcnpCard "^\s\{0,4}embdf"

" Materials.
syn match mcnpCard "^\s\{0,4}m\d\+"
syn match mcnpCard "^\s\{0,4}mt\d\+"
syn match mcnpCard "^\s\{0,4}mx\d\+"
syn match mcnpCard "^\s\{0,4}xs\d\+"
syn match mcnpCard "^\s\{0,4}otfdb"
syn match mcnpCard "^\s\{0,4}totnu"
syn match mcnpCard "^\s\{0,4}nonu"
syn match mcnpCard "^\s\{0,4}awtab"
syn match mcnpCard "^\s\{0,4}void"
syn match mcnpCard "^\s\{0,4}mgopt"
syn match mcnpCard "^\s\{0,4}drxs"

" Thermal scattering data.
" LA-UR-17-20709
syn match mcnpConstant "al27.\d\+t"
syn match mcnpConstant "be.\d\+t"
syn match mcnpConstant "be-o.\d\+t"
syn match mcnpConstant "benz.\d\+t"
syn match mcnpConstant "beo.\d\+t"
syn match mcnpConstant "dortho.\d\+t"
syn match mcnpConstant "dpara.\d\+t"
syn match mcnpConstant "fe56.\d\+t"
syn match mcnpConstant "grph.\d\+t"
syn match mcnpConstant "h-zr.\d\+t"
syn match mcnpConstant "h/zr.\d\+t"
syn match mcnpConstant "hortho.\d\+t"
syn match mcnpConstant "hpara.\d\+t"
syn match mcnpConstant "hwtr.\d\+t"
syn match mcnpConstant "lmeth.\d\+t"
syn match mcnpConstant "lwtr.\d\+t"
syn match mcnpConstant "o-be.\d\+t"
syn match mcnpConstant "o/be.\d\+t"
syn match mcnpConstant "o2-u.\d\+t"
syn match mcnpConstant "o2-u.\d\+t"
syn match mcnpConstant "poly.\d\+t"
syn match mcnpConstant "si02.\d\+t"
syn match mcnpConstant "smeth.\d\+t"
syn match mcnpConstant "u-o2.\d\+t"
syn match mcnpConstant "u/o2.\d\+t"
syn match mcnpConstant "zr-h.\d\+t"
syn match mcnpConstant "zr/h.\d\+t"
" ENDF/B-VIII
syn match mcnpConstant "al-27.\d\+t"
syn match mcnpConstant "be-beo.\d\+t"
syn match mcnpConstant "be-met.\d\+t"
syn match mcnpConstant "benz.\d\+t"
syn match mcnpConstant "c-sic.\d\+t"
syn match mcnpConstant "d-d2o.\d\+t"
syn match mcnpConstant "fe-56.\d\+t"
syn match mcnpConstant "grph10.\d\+t"
syn match mcnpConstant "grph30.\d\+t"
syn match mcnpConstant "grph.\d\+t"
syn match mcnpConstant "h-h2o.\d\+t"
syn match mcnpConstant "h-ice.\d\+t"
syn match mcnpConstant "h-luci.\d\+t"
syn match mcnpConstant "h-poly.\d\+t"
syn match mcnpConstant "h-yh2.\d\+t"
syn match mcnpConstant "h-zrh.\d\+t"
syn match mcnpConstant "lmeth.\d\+t"
syn match mcnpConstant "n-un.\d\+t"
syn match mcnpConstant "o-beo.\d\+t"
syn match mcnpConstant "o-d2o.\d\+t"
syn match mcnpConstant "o-ice.\d\+t"
syn match mcnpConstant "orthoD.\d\+t"
syn match mcnpConstant "orthoH.\d\+t"
syn match mcnpConstant "o-uo2.\d\+t"
syn match mcnpConstant "paraD.\d\+t"
syn match mcnpConstant "paraH.\d\+t"
syn match mcnpConstant "sio2.\d\+t"
syn match mcnpConstant "si-sic.\d\+t"
syn match mcnpConstant "smeth.\d\+t"
syn match mcnpConstant "u-un.\d\+t"
syn match mcnpConstant "u-uo2.\d\+t"
syn match mcnpConstant "y-yh2.\d\+t"
syn match mcnpConstant "zr-zrh.\d\+t"

" Physics data cards.
syn match mcnpCard "^\s\{0,4}mode"
syn match mcnpCard "^\s\{0,4}phys"
syn match mcnpCard "^\s\{0,4}cut"
syn match mcnpCard "^\s\{0,4}tmp"
syn match mcnpCard "^\s\{0,4}thtme"
syn match mcnpCard "^\s\{0,4}mphys"
syn match mcnpCard "^\s\{0,4}unc"
syn match mcnpCard "^\s\{0,4}cosyp"
syn match mcnpCard "^\s\{0,4}cosy"
syn match mcnpKeyword "field"
syn match mcnpCard "^\s\{0,4}field"

syn match mcnpCard "^\s\{0,4}act"
syn keyword mcnpKeyword fission nonfiss dn dg thresh dnbias nap dneb dgeb pecut hlcut sample

syn match mcnpCard "^\s\{0,4}lca"
syn keyword mcnpKeyword ielas ipreq iexisa ichoic jcoul nexite npidk noact icem ilaq nevtype
syn match mcnpCard "^\s\{0,4}lcb"
syn match mcnpCard "^\s\{0,4}lcc"
syn match mcnpCard "^\s\{0,4}lea"
syn match mcnpCard "^\s\{0,4}leb"

syn match mcnpCard "^\s\{0,4}fmult"
syn keyword mcnpKeyword width sfyield watt method data shift

syn match mcnpCard "^\s\{0,4}tropt"
syn keyword mcnpKeyword mcscat eloss nreact nescat genxs

syn match mcnpCard "^\s\{0,4}bfld"
syn keyword mcnpKeyword vec mxdeflc maxstep axs ffedges refpnt

" Source specification.
syn match mcnpCard "^\s\{0,4}sdef"
syn keyword mcnpKeyword sur erg tme dir vec nrm pos rad ext axs ccc ara wgt tr eff par dat loc bem bap
syn match mcnpCard "^\s\{0,4}si\d\+"
syn match mcnpCard "^\s\{0,4}sp\d\+"
syn match mcnpCard "^\s\{0,4}sb\d\+"
syn match mcnpCard "^\s\{0,4}ds\d\+"
syn match mcnpCard "^\s\{0,4}sc\d\+"
syn match mcnpCard "^\s\{0,4}ssw"
syn match mcnpCard "^\s\{0,4}ssr"
syn match mcnpCard "^\s\{0,4}kcode"
syn match mcnpCard "^\s\{0,4}ksrc"
syn match mcnpCard "^\s\{0,4}hsrc"
syn match mcnpCard "^\s\{0,4}burn"

" Tallies.
syn match mcnpCard "^\s\{0,4}+\{0,1}\*\{0,1}f\d\+"
syn match mcnpCard "^\s\{0,4}fc\d\+"
syn match mcnpCard "^\s\{0,4}e\d\+"
syn match mcnpCard "^\s\{0,4}t\d\+"
syn match mcnpCard "^\s\{0,4}c\d\+"
syn match mcnpCard "^\s\{0,4}\*c\d\+"
syn match mcnpCard "^\s\{0,4}fq\d\+"
syn match mcnpCard "^\s\{0,4}fm\d\+"
syn match mcnpCard "^\s\{0,4}em\d\+"
syn match mcnpCard "^\s\{0,4}tm\d\+"
syn match mcnpCard "^\s\{0,4}cm\d\+"
syn match mcnpCard "^\s\{0,4}cf\d\+"
syn match mcnpCard "^\s\{0,4}sf\d\+"
syn match mcnpCard "^\s\{0,4}fs\d\+"
syn match mcnpCard "^\s\{0,4}sd\d\+"
syn match mcnpCard "^\s\{0,4}fu\d\+"
syn match mcnpCard "^\s\{0,4}tf\d\+"

syn match mcnpCard "^\s\{0,4}cm\d\+"
syn match mcnpCard "^\s\{0,4}fic\d\+"
syn match mcnpCard "^\s\{0,4}fip\d\+"
syn match mcnpCard "^\s\{0,4}fir\d\+"

syn match mcnpCard "^\s\{0,4}d[ef]\s\+"
syn match mcnpCard "^\s\{0,4}d[ef]\d\+"
syn match mcnpCard "^\s\{0,4}d[ef]\d\+"
syn keyword mcnpKeyword iu fac ic
syn keyword mcnpConstant log lin

" Special tally treatments.
syn match mcnpCard "^\s\{0,4}ft\d\+"
syn keyword mcnpCard frv geb tmc inc icd scx scd elc ptt phl cap res tag let roc pds fft com

" Perturbation and sensitivity cards.
syn match mcnpCard "^\s\{0,4}pert\d\+"
syn keyword mcnpKeyword cell mat rho method erg rxn

syn match mcnpCard "^\s\{0,4}kpert\d\+"
syn keyword mcnpKeyword cell mat rho iso rxn erg linear

syn match mcnpCard "^\s\{0,4}ksen\d\+"
syn keyword mcnpKeyword iso rxn mt erg ein legendre cos constrain

" TMesh.
syn match mcnpKeyword "tmesh"
syn match mcnpCard "^\s\{0,4}tmesh"
syn match mcnpCard "^\s\{0,4}rmesh\d\+"
syn match mcnpCard "^\s\{0,4}cmesh\d\+"
syn match mcnpCard "^\s\{0,4}smesh\d\+"
syn match mcnpCard "^\s\{0,4}cor[abc]\d\+"
syn match mcnpCard "^\s\{0,4}ergsh"
syn match mcnpCard "^\s\{0,4}mshmf\d\+"
syn match mcnpCard "^\s\{0,4}endmd"
syn keyword mcnpKeyword traks flux dose popul pedep mfact trans
syn keyword mcnpKeyword total recol tlest edlct
syn match mcnpKeyword "de\/dx"

" FMesh.
syn match mcnpCard "^\s\{0,4}\*\{0,1}fmesh\d\+"
syn keyword mcnpKeyword geom origin axs vec
syn keyword mcnpKeyword imesh iints jmesh jints kmesh kints emesh eints enorm tints tnorm
syn keyword mcnpKeyword out tr inc type kclear
syn keyword mcnpConstant xyz rzt col cf ij ik jk none

" Variance-reduction cards.
syn match mcnpCard "^\s\{0,4}imp"
syn match mcnpCard "^\s\{0,4}var"
syn match mcnpCard "^\s\{0,4}wwe"
syn match mcnpCard "^\s\{0,4}wwt"
syn match mcnpCard "^\s\{0,4}wwn\d\+"
syn match mcnpCard "^\s\{0,4}wwp"
syn match mcnpCard "^\s\{0,4}wwg"
syn match mcnpCard "^\s\{0,4}wwge"
syn match mcnpCard "^\s\{0,4}wwgt"
syn match mcnpCard "^\s\{0,4}esplt"
syn match mcnpCard "^\s\{0,4}tsplt"
syn match mcnpCard "^\s\{0,4}ext"
syn match mcnpCard "^\s\{0,4}vect\s\+v"
syn match mcnpCard "^\s\{0,4}fcl"
syn match mcnpCard "^\s\{0,4}dxt"
syn match mcnpCard "^\s\{0,4}dd\d*"
syn match mcnpCard "^\s\{0,4}pd\d\+"
syn match mcnpCard "^\s\{0,4}dxc\d\+"
syn match mcnpCard "^\s\{0,4}bbrem"
syn match mcnpCard "^\s\{0,4}pikmt"
syn match mcnpCard "^\s\{0,4}spabi"
syn match mcnpCard "^\s\{0,4}pwt"

" Problem-termination cards.
syn match mcnpKeyword "nps"
syn match mcnpCard "^\s\{0,4}nps"
syn match mcnpCard "^\s\{0,4}ctme"
syn match mcnpCard "^\s\{0,4}stop"

" Output-control cards.
syn match mcnpCard "^\s\{0,4}print"
syn match mcnpCard "^\s\{0,4}talnp"
syn match mcnpCard "^\s\{0,4}prdmp"

syn match mcnpCard "^\s\{0,4}ptrac"
syn keyword mcnpKeyword buffer file max meph write coinc event filter type cell surface tally value
syn keyword mcnpConstant asc bin all src bnk sur col ter
syn keyword mcnpConstant imp1 imp2 imp3 spare1 spare2 spare3 icl jsu idx ncp lev iii jjj kkk

syn match mcnpCard "^\s\{0,4}mplot"
syn match mcnpCard "^\s\{0,4}histp"

syn match mcnpCard "^\s\{0,4}read"
syn keyword mcnpKeyword file noecho echo decode encode

syn match mcnpCard "^\s\{0,4}rand"
syn keyword mcnpKeyword gen seed stride hist

syn match mcnpCard "^\s\{0,4}dbcn"
syn match mcnpCard "^\s\{0,4}lost"
syn match mcnpCard "^\s\{0,4}idum"
syn match mcnpCard "^\s\{0,4}rdum"
syn match mcnpCard "^\s\{0,4}files"

" Other data cards.
syn match mcnpCard "^\s\{0,4}spdtl"
syn match mcnpCard "^\s\{0,4}notrn"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Final actions.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

hi link mcnpCard        Statement
hi link mcnpComment     Comment
hi link mcnpConstant    Constant
hi link mcnpKeyword     Keyword
hi link mcnpOperator    Operator
hi link mcnpTitle       Special
hi link mcnpVariable    Constant

let b:current_syntax = "mcnp"
