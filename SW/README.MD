# Maszyna
## Pamięć/Kontekst maszyny
* Maszyna posiada po N komórek pamięci typu int16 oraz double N>=32
* Maszyna posiada M komórek pamięci przechowujących wskaźniki typu void
* Z pamięci wskaźnikowej powinno korzystać się wyłącznie jeśli jest to absolutnie konieczne
* Wszystkie informacje które mają zostać przechowane pomiędzy wywołaniami stanu oraz które mają zostać przekazane między stanami powinny zostać zapisane w pamięci maszyny
* Pierwsze 17 komórek pamięci typu int16(0-16) są komórkami specjalnego przeznaczenia i należy z nich świadomie korzystać(patrz Przerwania) 
## Stan
* Domyślny stan maszyny to stan 0
* Stan posiada kontekst składający się z 16 komórek int16 i 16 komórek double
* Kontekst stanu jest tworzony podczas tworzenia stanu i jest niezmienny podczas wykonywania programu
* Funkcje stanu zawsze przyjmują stan jako kontekst(kopia) oraz wskaźnik do maszyny
* Funkcje stanu muszą być typu void
* W funkcjach stanu można korzystać z lokalnych zmiennych
* Funkcje stanu powinny być atomiczne i nieblokujące
## Przerwania
Jeśli podczas zmiany stanu jedna z komórek pamięci int16(1-16) jest zerem aktywnym stanem staje się stan przypisany do tej komórki(1->1, 2->2, ..., 16->16). Jeśli więcej niż 1 komórka jest zerowa, aktywnym stanem jest stan o najniższym numerze.