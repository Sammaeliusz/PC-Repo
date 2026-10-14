``` mermaid
erDiagram
GRA{
    int ID PK
    int wlasciciel_Id FK
    string Nazwa
    decimal Ciezkosc
    int Min_graczy
    int Max_graczy
    time Czas
    enum Gatunek
    set Tagi
    bool Kooperacja
    bool Dostepna
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
GRA }|--|| GRACZ: wlasciciel_Id
ROZGRYWKI }|--|| GRA: gra_Id
GRACZE_ROZGRYWKI }o--|{ GRACZ: gracz_Id
GRACZE_ROZGRYWKI }|--|| ROZGRYWKI: rozgrywka_Id
WYPOZYCZENIA }o--|{ GRA: gra_Id
WYPOZYCZENIA }o--|{ GRACZ: wypozyczajacy_Id
```