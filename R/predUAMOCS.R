if (!requireNamespace("CMScaller", quietly = TRUE)) {
  devtools::install_github("Lothelab/CMScaller")
}
library(CMScaller)


predUAMOCS <- function(data,if_scale=T){
  #读入签名基因
  data_cms_txt <-"
id probe class dirct
2         APP   CS1    up
3       BAALC   CS1    up
4       PROM1   CS1    up
5        CD34   CS1    up
6        SDK2   CS1    up
7      SHANK3   CS1    up
8       NPDC1   CS1    up
9       F2RL1   CS1    up
10      MYCT1   CS1    up
11       H1F0   CS1    up
12     CHRDL1   CS1    up
13       NPR3   CS1    up
14      PEAR1   CS1    up
15        ABO   CS1    up
16        MN1   CS1    up
17   ADAMTS10   CS1    up
18     SETBP1   CS1    up
19       PAWR   CS1    up
20      SCRN1   CS1    up
21      HEMGN   CS1    up
22      SPON1   CS1    up
23      CALN1   CS1    up
24      BEND4   CS1    up
25       DNTT   CS1    up
26     ZNF521   CS1    up
27      CD109   CS1    up
28    C1orf21   CS1    up
29        HBB   CS1    up
30       HOPX   CS1    up
31       PXDN   CS1    up
32      MLLT3   CS1    up
33      SPRY1   CS1    up
34      DCHS1   CS1    up
35      ITGA9   CS1    up
36     STARD9   CS1    up
37       GBP4   CS1    up
38     ABLIM1   CS1    up
39       EHD2   CS1    up
40     TMIGD2   CS1    up
41     GPR173   CS1    up
42     CALCRL   CS1    up
43    FAM171B   CS1    up
44       LRP6   CS1    up
45   CDC42BPA   CS1    up
46     IFITM3   CS1    up
47     PLSCR4   CS1    up
48      CD200   CS1    up
49      CRHBP   CS1    up
50      SPARC   CS1    up
51     INPP4B   CS1    up
52       VCAN   CS2    up
53        HK3   CS2    up
54      MPEG1   CS2    up
55        LYZ   CS2    up
56       CES1   CS2    up
57        CDA   CS2    up
58       FBP1   CS2    up
59      CD163   CS2    up
60     S100A9   CS2    up
61       CD1D   CS2    up
62       CD14   CS2    up
63     LILRB4   CS2    up
64       MAFB   CS2    up
65     MS4A6A   CS2    up
66       KLF4   CS2    up
67     S100A8   CS2    up
68  LINC00482   CS2    up
69       HNMT   CS2    up
70       CSTA   CS2    up
71     SIRPB1   CS2    up
72      NFAM1   CS2    up
73       TLR8   CS2    up
74      IL1RN   CS2    up
75    S100A12   CS2    up
76        CPM   CS2    up
77     RNASE6   CS2    up
78      ANXA5   CS2    up
79    SIGLEC9   CS2    up
80      RBM47   CS2    up
81     SCPEP1   CS2    up
82       CYBB   CS2    up
83      PLBD1   CS2    up
84   SERPINB2   CS2    up
85     CX3CR1   CS2    up
86      BASP1   CS2    up
87      DEFB1   CS2    up
88     LGALS2   CS2    up
89    SIGLEC7   CS2    up
90    LDLRAD3   CS2    up
91     MS4A14   CS2    up
92     CD300C   CS2    up
93      SCIMP   CS2    up
94       TLR4   CS2    up
95     FCER1G   CS2    up
96       FGL2   CS2    up
97   SERPINA1   CS2    up
98      CCL23   CS2    up
99   SLC22A15   CS2    up
100 ARHGEF10L   CS2    up
101     MS4A7   CS2    up
102     IGLL1   CS3    up
103       MPO   CS3    up
104      CD96   CS3    up
105     GTSF1   CS3    up
106   C1QTNF4   CS3    up
107       LPO   CS3    up
108    SUCNR1   CS3    up
109     ZBED2   CS3    up
110    POU4F1   CS3    up
111   CLEC11A   CS3    up
112      CPA3   CS3    up
113     HPGDS   CS3    up
114     CYTL1   CS3    up
115      DLC1   CS3    up
116   DPY19L2   CS3    up
117      ST18   CS3    up
118     MACC1   CS3    up
119       WT1   CS3    up
120     NTNG2   CS3    up
121       LTK   CS3    up
122     S100B   CS3    up
123      MDFI   CS3    up
124      MEST   CS3    up
125      GGT5   CS3    up
126     ACSM1   CS3    up
127       AMN   CS3    up
128    PDLIM1   CS3    up
129     GATA2   CS3    up
130      MYCN   CS3    up
131   ZNF804A   CS3    up
132     LPAR4   CS3    up
133      QPRT   CS3    up
134     CRNDE   CS3    up
135     CPXM1   CS3    up
136      CCL1   CS3    up
137     ACSM3   CS3    up
138     RTN4R   CS3    up
139    DEPDC7   CS3    up
140     STON2   CS3    up
141     KCNQ5   CS3    up
142       EPX   CS3    up
143     MGST1   CS3    up
144   MICALL2   CS3    up
145      IRX1   CS3    up
146    WT1-AS   CS3    up
147     ITPKA   CS3    up
148    PTGDR2   CS3    up
149      SOX4   CS3    up
150     EVA1B   CS3    up
151    DEPTOR   CS3    up
"
  cms_data <- read.table(header=TRUE,text=data_cms_txt)
  cms_data <- cms_data[,-1]
  
  if (if_scale){
    data <- data[which(apply(data,1,sd)!=0),]
    data <- t(scale(t(data)))
  }
  
  
  #将data的签名基因提取出来
  data <- data[which(rownames(data) %in% cms_data$probe),]
  
  output <- CMScaller:::ntp(data,cms_data)
  
  return(output)
  
}















