#MICROLOCAL= editorial
MICROLOCAL= hipatia
PATHLOTE = ../../lotes/
PADRAO = EBOOK
PDF = LIVRO.pdf

PAGINADECREDITOS = 2
EXTENSAO = jpg
TITULOEPUB = MINO_MAT
COVER = capa.jpg
COD_PRODUTO = PRO2517
LOTE = LOTE4

TITLE = "A vida de Mat"
TITLESORT = "Vida de Mat, A"
SUBTITLE = 
INTERNET = a-vida-de-mat
AUTORS = "Mino Carta"  
AUTORSSORT = "Mino, Carta"
Contribuitors = "[AUTHOR|Mino Carta|Carta, Mino]"
ORGANIZACAO = 
TRADUCAO = ""
ISBN = 9788577155064
ISBN_IMPRESSO = 9788577154791
PRECO = "19,9"
PRECO_IMPRESSO = "34,9,90" 
DATA_LANCAMENTO = "2016-08-1" #YYYY-MM-DD
COMMENTS = "Mino Carta, um dos maiores jornalistas brasileiros, é aqui Mat, personagem de fundo autobiográfico que transita em dois ambientes: a Itália de sua juventude e um Brasil desfigurado pela ditadura. O livro descreve em reminiscências as paisagens da memória de Mat, como a riviera mediterrânea e suas nodosas oliveiras, que fazem sombra à hora do almoço e os gerânios púrpura que saltam aos olhos sob o sol da costa italiana. E nessas paisagens surgem as personagens femininas: Angelina, Matilda, Assunta, Gar, e a formidável Nuvem."
BIOGRAFIA = "Agosto de 1946, cheguei a São Paulo, trazido por meus pais, ainda vestia calças curtas. A cidade não passava de 1,5 milhão de habitantes, tinha medidas humanas. Pacata, ordeira, elegante em várias ruas centrais. São Luís, Barão de Itapetininga, Marconi, Vieira de Carvalho. Recantos verdes e vibrantes. Praça da República, Largo do Arouche. Senhorial a Avenida Paulista, ladeada por casarões, um deles o do Conde Matarazzo, dono de um Packard suntuosamente negro, na placa ostentava apenas e tão-somente o número 1."
RESENHA = 
SUMARIO = 
NUM_CAPITULOS = 
TRECHO = 
ASSUNTO = "Literatura brasileira" 
EDICAO = 1

BISAC = FIC027020
BISAC2 = FIC027000
WGS = 950
WGS2 = 
THEMA = DNC
THEMA2 = DN

IDIOMAORIGINAL = pt
PRODUCER = "Editora Hedra"
LANGUAGE = pt
DATE = 2016
PUBLISHER = "Hedra"

ProductType = ebook
Title = $(TITLE) 
Subtitle = $(SUBTITLE)
Contributors = "[AUTHOR\|$(AUTORS)][EDITED_BY_PERSON\|$(ORGANIZACAO)][TRANSLATED_BY\|$(TRADUCAO)]"
SeriesType = numbered
SeriesName = 
SeriesNumber = 
MinMaxAge = 
PagesEstimated = $(shell pdftk LIVRO.pdf dump_data | grep NumberOfPages | cut -d ":" -f2) 
ISBNEPUB = $(ISBN)
ISBNPDF = 
ISBNMobipocket = 
ISBNFixedLayout = 
ISBNIBooksAuthor = 
DRMType = HARD
ProductReleaseDate = $(shell date +"%Y-%m-%d" )
ProductCancellationDate = 
StandardPrices = [$(PRECO)|BRL]
PrintReleaseDate = $(DATA_LANCAMENTO)
ISBNPrint = $(ISBN_IMPRESSO)
PricePrint = [$(PRECO_IMPRESSO)|BRL]
GenreCodeBisac1 = $(BISAC)
GenreCodeBisac2 = $(BISAC2)
GenreCodeWgs1 = $(WGS)
GenreCodeWgs2 = $(WGS2)
GenreCodeThema1 = $(THEMA)
GenreCodeThema2 = $(THEMA2)
GenreCodeThemaQualifiers = 
ProductLanguage = $(LANGUAGE)
SecondLanguage = 
OriginalLanguage = $(IDIOMAORIGINAL)
ProductInfoText = $(COMMENTS)
AuthorBiography = $(BIOGRAFIA)
Reviews = $(RESENHA)
TableOfContents = $(SUMARIO)
TextExtract = $(TRECHO)
Keywords = $(ASSUNTO)
AuthorWebsite = 
ProductWebsite = https://hedra.com.br/livros/$(INTERNET)
TerritoryListType = without
Territories = 
ShopListType = 
Shops = 
CountryPrices = 
ProductVersion = 
ProductVersionNumber = $(EDICAO)
NumberOfChapters = $(NUM_CAPITULOS)
PublisherID = 2286591





all:
#	-sh texrepair.sh
#	hevea $(PADRAO).tex -o $(PADRAO).html
#	sed -i 's/\<img src="CREDITOS\.png\>/\<img alt="Créditos" src="CREDITOS.png"\>/' EBOOK.html
#	ebook-convert $(PADRAO).html $(PADRAO).mobi --page-breaks-before / --toc-threshold 0 --level1-toc //h:h2 --level2-toc //h:h3 --level3-toc //h:h4 --cover ../capa.png 
	ebook-convert $(PADRAO).html $(PADRAO).mobi --title $(TITLE) --authors $(AUTORS) --comments $(COMMENTS) --publisher $(PUBLISHER) --rating 4 --book-producer $(PRODUCER) --language $(LANGUAGE) --author-sort $(AUTORSSORT) --title-sort $(TITLESORT) --isbn $(ISBN) --pubdate $(DATE) --series $(SERIES) --tags $(TAGS) --page-breaks-before / --toc-threshold 0 --level2-toc //h:h1 --level2-toc //h:h2 --level3-toc //h:h3 --cover $(COVER) 
	ebook-convert $(PADRAO).html $(PADRAO).epub --title $(TITLE) --authors $(AUTORS) --comments $(COMMENTS) --publisher $(PUBLISHER) --rating 4 --book-producer $(PRODUCER) --language $(LANGUAGE) --author-sort $(AUTORSSORT) --title-sort $(TITLESORT) --isbn $(ISBN) --pubdate $(DATE) --series $(SERIES) --tags $(TAGS) --page-breaks-before / --toc-threshold 0 --level2-toc //h:h1 --level2-toc //h:h2 --level3-toc //h:h3 --cover $(COVER) 

viewer:
	ebook-viewer EBOOK.epub

credits:
	pdftk $(PDF) cat $(PAGINADECREDITOS) output CREDITOS.pdf
	convert -density 200 CREDITOS.pdf -quality 100 CREDITOS.png
#	mogrify -format png CREDITOS.pdf
#	mogrify -shave 190x120 -gravity south -chop x200 -frame 30 CREDITOS.png	
#	mogrify -shave 190x120 -gravity south CREDITOS.png	
#	mogrify -resize 601 CREDITOS.png

rename:
	cp $(PADRAO).epub $(TITULOEPUB).epub
	cp $(PADRAO).mobi $(TITULOEPUB).mobi
	cp $(PDF) $(TITULOEPUB).pdf
	zip $(TITULOEPUB).zip $(TITULOEPUB).*	
hifens:
	sed -i 's/"-/-/g' *.tex	
copy:
	cp ~/LATEX/git/ebook/EBOOK.tex .
	cp ~/LATEX/git/ebook/.gitignore .
	cp ~/LATEX/git/ebook/english.hva .
	cp ~/LATEX/git/ebook/repair.sh .
	cp ~/LATEX/git/ebook/texrepair.sh .
	cp ~/LATEX/git/ebook/README.markdown .
	cp ~/LATEX/git/ebook/stylesheet.css .
	cp ~/LATEX/git/ebook/precos.txt .
check:
	epubcheck $(PADRAO).epub
sigil:
	sigil $(PADRAO).epub
capa:
	#mogrify -type Grayscale $(COVER)
	mogrify -resize 601 $(COVER)
	cp $(COVER) $(TITULOEPUB).${EXTENSAO}
	mogrify -resize x2550 $(TITULOEPUB).${EXTENSAO}
	mogrify -format jpg $(TITULOEPUB).${EXTENSAO}
entrega:
	cp $(TITULOEPUB).epub $(HOME)/Dropbox/CONTRATOS_GERAIS/
	cp $(TITULOEPUB).mobi $(HOME)/Dropbox/CONTRATOS_GERAIS/
	cp $(TITULOEPUB).zip  $(HOME)/Dropbox/CONTRATOS_GERAIS/
	cp $(TITULOEPUB).pdf  $(HOME)/Dropbox/CONTRATOS_GERAIS/
	cp $(TITULOEPUB).txt  $(HOME)/Dropbox/CONTRATOS_GERAIS/
	cp $(TITULOEPUB).jpg  $(HOME)/Dropbox/CONTRATOS_GERAIS/
metadados:
	echo "TÍTULO:\t\t\t" $(TITLE) >  $(TITULOEPUB).txt
	echo "-----------------------------------------------------------" >>  $(TITULOEPUB).txt	
	echo "AUTOR:\t\t\t" $(AUTORS) >>  $(TITULOEPUB).txt	
	echo "-----------------------------------------------------------" >>  $(TITULOEPUB).txt	
	echo "ORGANIZADOR:" $(ORGANIZADOR) >>  $(TITULOEPUB).txt	
	echo "-----------------------------------------------------------" >>  $(TITULOEPUB).txt	
	echo "TRADUTOR:\t\t" $(TRADUTOR) >>  $(TITULOEPUB).txt	
	echo "-----------------------------------------------------------" >>  $(TITULOEPUB).txt	
	echo "ISBN:\t\t\t\t" $(ISBN) >>  $(TITULOEPUB).txt	
	echo "-----------------------------------------------------------" >>  $(TITULOEPUB).txt	
	echo "ISBN IMPRESSO:\t\t\t" $(ISBN_IMPRESSO) >>  $(TITULOEPUB).txt	
	echo "-----------------------------------------------------------" >>  $(TITULOEPUB).txt	
	echo "ANO:\t\t\t\t" $(DATE) >>  $(TITULOEPUB).txt	
	echo "-----------------------------------------------------------" >>  $(TITULOEPUB).txt	
	echo "TEXTO: " $(COMMENTS) >>  $(TITULOEPUB).txt	
	echo "-----------------------------------------------------------" >>  $(TITULOEPUB).txt	
	pdftk LIVRO.pdf dump_data | grep NumberOfPages >> $(TITULOEPUB).txt 
	echo "-----------------------------------------------------------" >>  $(TITULOEPUB).txt	
	echo "BISAC =" $(BISAC) >> $(TITULOEPUB).txt 
	echo "-----------------------------------------------------------" >>  $(TITULOEPUB).txt	
	echo "BISAC2 =" $(BISAC2) >> $(TITULOEPUB).txt 
	echo "-----------------------------------------------------------" >>  $(TITULOEPUB).txt	
	echo "WGS =" $(WGS) >> $(TITULOEPUB).txt 
	echo "-----------------------------------------------------------" >>  $(TITULOEPUB).txt	
	echo "WGS2 =" $(WGS2) >> $(TITULOEPUB).txt 
	echo "-----------------------------------------------------------" >>  $(TITULOEPUB).txt	
	echo "THEMA =" $(THEMA) >> $(TITULOEPUB).txt 
	echo "-----------------------------------------------------------" >>  $(TITULOEPUB).txt	
	echo "THEMA2 =" $(THEMA2) >> $(TITULOEPUB).txt 
	echo "-----------------------------------------------------------" >>  $(TITULOEPUB).txt	
	echo "TAGS: " $(ASSUNTO) >> $(TITULOEPUB).txt 
	echo "-----------------------------------------------------------" >>  $(TITULOEPUB).txt	
	echo "PRECO IMPRESSO: " $(PRECO) >> $(TITULOEPUB).txt 
	echo "-----------------------------------------------------------" >>  $(TITULOEPUB).txt	

capa-internet:
	wget https://hedra.com.br/uploads/book/cover/$(INTERNET).${EXTENSAO}
#	cp $(HOME)/Dropbox/ARQUIVOS_GERAIS/GERAL/CAPAS_JPG/$(INTERNET).${EXTENSAO} .
	mv $(INTERNET).${EXTENSAO} $(COVER)
	mogrify -format png $(COVER)
atualiza:
	-cp Makefile ../ebook/
	-cp *.sh ../ebook/
	-cp EBOOK.tex ../ebook/	
clean:
	rm *.html *.htoc *.haux
matriz:
	-cp Makefile ~/LATEX/git/ebook	
	-cp repair.sh ~/LATEX/git/ebook	
	-cp EBOOK.tex ~/LATEX/git/ebook	
	-cp texrepair.sh ~/LATEX/git/ebook	
	-cp stylesheet.css ~/LATEX/git/ebook	
	-cp README.markdown ~/LATEX/git/ebook	
	-cp precos.txt ~/LATEX/git/ebook	
isbn:
	google-chrome http://redmine.hedra.com.br/projects/producaoeditorial/wiki/ISBNs
wgs:	
	evince $(HOME)/Dropbox/CONTRATOS_GERAIS/CLASSIFICACOES/WGS.pdf
thema:
	evince $(HOME)/Dropbox/CONTRATOS_GERAIS/CLASSIFICACOES/Thema.pdf
bisac:
	google-chrome https://www.bisg.org/complete-bisac-subject-headings-2014-edition
lote:
	-mkdir -p $(PATHLOTE)$(LOTE) 
	-cat $(TITULOEPUB).csv >> $(PATHLOTE)$(LOTE)/$(LOTE).csv		
	-cp $(TITULOEPUB).epub $(PATHLOTE)$(LOTE)/
	-cp $(TITULOEPUB).jpg $(PATHLOTE)$(LOTE)/

bookwire:
	-google-chrome http://macs.bookwire.de/
	-cd ~/EBOOK/
	-gedit $(TITULOEPUB).txt
csv-bookwire:
	echo "\"$(ProductType)\";\"$(Title)\";\"$(Subtitle)\";\"$(Contributors)\";\"$(SeriesType)\";\"$(SeriesName)\";\"$(SeriesNumber)\";\"$(MinMaxAge)\";\"$(PagesEstimated)\";\"$(ISBNEPUB)\";\"$(ISBNPDF)\";\"$(ISBNMobipocket)\";\"$(ISBNFixedLayout)\";\"$(ISBNIBooksAuthor)\";\"$(DRMType)\";\"$(ProductReleaseDate)\";\"$(ProductCancellationDate)\";\"$(StandardPrices)\";\"$(PrintReleaseDate)\";\"$(ISBNPrint)\";\"$(PricePrint)\";\"$(GenreCodeBisac1)\";\"$(GenreCodeBisac2)\";\"$(GenreCodeWgs1)\";\"$(GenreCodeWgs2)\";\"$(GenreCodeThema1)\";\"$(GenreCodeThema2)\";\"$(GenreCodeThemaQualifiers)\";\"$(ProductLanguage)\";\"$(SecondLanguage)\";\"$(OriginalLanguage)\";\"$(ProductInfoText)\";\"$(AuthorBiography)\";\"$(Reviews)\";\"$(TableOfContents)\";\"$(TextExtract)\";\"$(Keywords)\";\"$(AuthorWebsite)\";\"$(ProductWebsite)\";\"$(TerritoryListType)\";\"$(Territories)\";\"$(ShopListType)\";\"$(Shops)\";\"$(CountryPrices)\";\"$(ProductVersion)\";\"$(ProductVersionNumber)\";\"$(NumberOfChapters)\";\"$(PublisherID)\";" >> $(TITULOEPUB).bk
	iconv -f utf-8 -t UTF-16 $(TITULOEPUB).bk > $(TITULOEPUB).csv 
	rm $(TITULOEPUB).bk
