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
    time Preferowany_czas
    int PIN
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
``` mermaid
stateDiagram-v2
    [*] --> Stworzenie_konta

    Stworzenie_konta --> Konto_aktywne
    Konto_aktywne --> IDLE
    IDLE --> Dodanie_gry
    IDLE --> Dodanie_rozgrywki
    Dodanie_rozgrywki --> Dodanie_graczy_i_wyników
    Dodanie_graczy_i_wyników --> IDLE
    Dodanie_gry --> Dodanie_instancji : Gra istnieje
    Dodanie_gry --> Dodanie_tytułu : Gra nie istnieje
    Dodanie_tytułu --> Dodanie_instancji
    Dodanie_instancji --> Dodanie_tagów_do_listy_tagów : Nieistniejące tagi
    Dodanie_instancji --> Dodanie_tagów_do_gry : Istniejące tagi
    Dodanie_tagów_do_listy_tagów --> Dodanie_tagów_do_gry
    Dodanie_tagów_do_gry --> IDLE
    IDLE --> Wyświetlenie_listy_gier
    Wyświetlenie_listy_gier --> Wybór_bibliotek
    Wybór_bibliotek --> Wybór_filtrów
    Wybór_filtrów --> Wyniki
    Wyniki --> IDLE
    IDLE --> Generacja_statystyk
    Generacja_statystyk --> Statystyki_rozgrywek 
    Generacja_statystyk --> Statystyki_gier
    Statystyki_rozgrywek --> Wybór_dat : Wszystkie grane tytuły
    Statystyki_rozgrywek --> Wybór_gry : Jeden tytuł
    Wybór_dat --> Raport
    Wybór_gry --> Wybór_dat
    Statystyki_gier --> Wybór_gry : Wybrany tytuł
    Statystyki_gier --> Wybór_dat : Wszystkie tytuły w kolekcji gracza
    Raport --> IDLE
    IDLE --> Dodanie_znajomego
    Dodanie_znajomego --> IDLE
    IDLE --> Wypożyczenie
    Wypożyczenie --> Wybór_kopii_gry
    Wybór_kopii_gry --> Wybór_gracza_który_pożycza
    Wybór_gracza_który_pożycza --> Wybór_terminu_wypożyczenia
    Wybór_terminu_wypożyczenia --> Wybór_terminu_zwrotu
    Wybór_terminu_zwrotu --> IDLE
    IDLE --> Konfiguracja_konta
    Konfiguracja_konta --> IDLE : Wyjście
    Konfiguracja_konta --> Wybór_max_ciężkości
    Konfiguracja_konta --> Wybór_preferowanego_czasu
    Wybór_preferowanego_czasu --> Konfiguracja_konta
    Wybór_max_ciężkości --> Konfiguracja_konta
    Konfiguracja_konta --> Wybór_preferancji_tagów
    Wybór_preferancji_tagów --> Dodanie_tagów_do_listy : Tagi nie istnieje
    Wybór_preferancji_tagów --> Konfiguracja_konta : Tagi istnieją
    Dodanie_tagów_do_listy --> Konfiguracja_konta
```
