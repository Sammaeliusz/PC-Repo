``` mermaid
erDiagram
GRA{
    int ID PK
    string Nazwa
    decimal Ciezkosc
    int Min_graczy
    int Max_graczy
    time Czas
    enum Gatunek
    bool Kooperacja
}
KOLEKCJA{
    int ID PK
    int Wlasciciel_Id FK
    int Gra_Id FK
    bool Dostepna
    int Ocena
}
TAG_GRY{
    int Gra_Id FK
    int Tag_Id FK
    int Instancja_Id FK
}
GRACZ{
    int ID PK
    string Email UK
    string Nazwa_gracza UK
    decimal Max_ciezkosc
}
ROZGRYWKI{
    int ID PK
    int Gra_Id FK
    time Czas_rozgrywki
    date Data_rozgrywki
}
GRACZE_ROZGRYWKI{
    int ID FK
    int Gracz_Id FK
    int Miejsce
    int Punkty
}
WYPOZYCZENIA{
    int ID PK
    int Gra_Id FK
    int Wypozyczajacy_Id FK
    date Data_wypozyczenia
    date Data_zwrotu

}
TAGI{
    int ID PK
    string Zawartosc
}
ZNAJOMI{
    int Gracz1_Id FK
    int Gracz2_Id FK
}
TAG_GRACZE{
    int Gracz_Id FK
    int Tag_Id FK
    bool Lubi
}
KOLEKCJA }|--|| GRACZ: Wlasciciel_Id
KOLEKCJA }o--o{ GRA: Gra_Id
ROZGRYWKI }|--|| GRA: Gra_Id
GRACZE_ROZGRYWKI }o--|{ GRACZ: Gracz_Id
GRACZE_ROZGRYWKI }|--|| ROZGRYWKI: Rozgrywka_Id
WYPOZYCZENIA }o--|{ KOLEKCJA: Gra_Id
WYPOZYCZENIA }o--|{ GRACZ: Wypozyczajacy_Id
TAGI }|--o{ TAG_GRY: Tag_Id
GRA }o--o{ TAG_GRY: Gra_Id
KOLEKCJA }o--o{ TAG_GRY: Instancja_Id
ZNAJOMI }o--|| GRACZ: Gracz1_Id
ZNAJOMI }o--|| GRACZ: Gracz2_Id
TAG_GRACZE }o--|| GRACZ: Gracz_Id
TAG_GRACZE }o--|| TAGI: Tag_Id
```
