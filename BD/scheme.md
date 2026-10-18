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
    int wlasciciel_Id FK
    int gra_Id FK
    bool Dostepna
    int ocena
}
TAGOGRY_TBD{
    int gra_Id
    int tag_Id
}
GRACZ{
    int ID PK
    string Nazwa
    decimal Max_ciezkosc
    set Preferowane_tagi
    set Niepozadane_tagi
}
ROZGRYWKI{
    int ID PK
    int gra_Id FK
    time czas_rozgrywki
    date data_rozgrywki
}
GRACZE_ROZGRYWKI{
    int rozgrywka_Id FK
    int gracz_Id FK
    int miejsce
    int punkty
}
WYPOZYCZENIA{
    int ID PK
    int gra_Id FK
    int wypozyczajacy_Id FK
    date data_wypozyczenia
    date data_zwrotu

}
TAGI{
    int ID PK
    string nazwa
}
KOLEKCJA }|--|| GRACZ: wlasciciel_Id
KOLEKCJA }o--o{ GRA: gra_Id
ROZGRYWKI }|--|| GRA: gra_Id
GRACZE_ROZGRYWKI }o--|{ GRACZ: gracz_Id
GRACZE_ROZGRYWKI }|--|| ROZGRYWKI: rozgrywka_Id
WYPOZYCZENIA }o--|{ KOLEKCJA: gra_Id
WYPOZYCZENIA }o--|{ GRACZ: wypozyczajacy_Id
TAGI }|--o{ TAGOGRY_TBD: tag_Id
GRA }o--o{ TAGOGRY_TBD: gra_Id
```