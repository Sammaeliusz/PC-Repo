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
    int Gra_Id PK
    set Tag_Id
}
GRACZ{
    int ID PK
    string Email UK
    string Nazwa_gracza UK
    decimal Max_ciezkosc
    set Ulubione_tagi_Id
    set Nielubiane_tagi_Id
    set Znajomi_Id
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
KOLEKCJA }|--|| GRACZ: Wlasciciel_Id
KOLEKCJA }o--o{ GRA: Gra_Id
ROZGRYWKI }|--|| GRA: Gra_Id
GRACZE_ROZGRYWKI }o--|{ GRACZ: Gracz_Id
GRACZE_ROZGRYWKI }|--|| ROZGRYWKI: Rozgrywka_Id
WYPOZYCZENIA }o--|{ KOLEKCJA: Gra_Id
WYPOZYCZENIA }o--|{ GRACZ: Wypozyczajacy_Id
TAGI }|--o{ TAG_GRY: Tag_Id
GRA }o--o{ TAG_GRY: Gra_Id
```
