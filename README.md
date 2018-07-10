# Cechy języka

## Dynamiczny

- Dodawna elemntów kodu w trakcie wykonania
- Dynamiczne typowanie
- Jęzki 'skryptowe'

## Interpretowany

- Brak kompilacji
- Maszyna wirtualna
- Różna implementacje interpretera

Ruby podczas interpretacji alokuje odpowiednią ilość pamięci, na przechowywanie danych zmiennych.

## Refleksja

- Odnajdywanie i modyfikowanie bloków kodu w trakcie jego wykonania
- Konwersja stringów na referencje
- String może być ewaluowany w trakcie wykonania pragramu jako normalny kod
- Zmiana deklaracji klasy w trakcie runtime'u

## Obiektowy ( + funkcyjne, proceduralne)

- Dziedziczenie, polimorfizm, enkapsulacja
- Kompozycja (?) - wzbogacenie klas o interfejsy (???)
- Wszystko obiekty (klasy)

## General purpose

- Nie ma konkretnej roli

## REPL - Read, Eval, Print, Loop

Dla rubyego irb - interactive ruby shell

```
$ irb
```

Ostatnia zwrócona wartość przez REPL-a jest przechowywane pod znakiem _

```
irb(main):001:0> 2 + 2
=> 4
irb(main):002:0> _
=> 4
irb(main):003:0> number = _
```

## Duck Typing

```
irb(main):005:0> 5/45
=> 0
irb(main):006:0> 5/45.0
=> 0.1111111111111111
```

```
irb(main):007:0> 3 + 5.0/45
=> 3.111111111111111
irb(main):008:0> 3.0 + 5/35
=> 3.0
```

# Logika I rzędu

- true
- false
- nil (Odpowiednik nulla)

## Operatory logiczne

- and (&&)
- or (||)
- not (!)
- == - porównanie
- === - porównanie referencji

Symbole zawsze mają pierwszeństwo przed wykonaniem tekstu

```
irb(main):009:0> false and false  or true
=> true
irb(main):010:0> false and (false or true)
=> false
irb(main):011:0> false and false || true
=> false
irb(main):012:0> false && false || true
=> true
irb(main):013:0> false && (false || true)
=> false
```

# Artymetyka

Nawiasy do grupowanie itd.
```
irb(main):014:0> 3 + 4 * 12
=> 51
irb(main):016:0> (3 + 4) * 12
=> 84
```

# Typy danych

## String
Do deklaracji "", ''
Jedno pozwala na interpolację stringów, drugie nie.

```
irb(main):017:0> "test".length
=> 4
irb(main):018:0> "test".size
=> 4
irb(main):020:0> "test".upcase
=> "TEST"
irb(main):021:0> "test".downcase
=> "test"
irb(main):022:0> "test".capitalize
=> "Test"
```

```
irb(main):023:0> user_email = 'example@example.com'
=> "example@example.com"
```

### Konkatynacja
```
irb(main):024:0> "Witaj, " + user_email
=> "Witaj, example@example.com"
```

### Interpolacja
```
irb(main):025:0> "Witaj, #{user_email}"
=> "Witaj, example@example.com"
```

```
irb(main):026:0> "Witaj, #{user_email}"
=> "Witaj, example@example.com"
irb(main):027:0> 'Witaj, #{user_email}'
=> "Witaj, \#{user_email}"
irb(main):028:0> "Witaj, #{ 3.0 + 5/45 }"
=> "Witaj, 3.0"
```

### Escape characters

```
irb(main):029:0> "Witaj, \#{ 3.0 + 5/45 }"
=> "Witaj, \#{ 3.0 + 5/45 }"
```


Pomiędzy {} kod ruby'ego
'' - Szybsze, nie sprawdza czy jest coś do interpolowania.
"" - Pozwala na interpolację

## Array
### Syntax
Dynamiczny, nie musimy wiedzieć ile elementów będzie potrzebne.
Jeśli chcemy ograniczyć to podajemy w konstruktorze.
```
irb(main):037:0> []
=> []
irb(main):038:0> [].class
=> Array
irb(main):039:0> ary = Array.new
=> []
irb(main):040:0> ary.class
=> Array
irb(main):041:0> ary = Array.new(7)
=> [nil, nil, nil, nil, nil, nil, nil]
```

Nie muszą być jednego typu, wszystko co znajduje się w arrayu jest obiektem
```
irb(main):042:0> [1, 2, 3]
=> [1, 2, 3]
irb(main):043:0> [1, 2, "test"]
=> [1, 2, "test"]
irb(main):043:0> [1, 2, "test"]
=> [1, 2, "test"]
irb(main):044:0> [1, 2, "test", "super string #{user_email}"]
=> [1, 2, "test", "super string example@example.com"]
```

### Dodawanie i odczytywanie wartości
pop zwraca wywalony element
```
irb(main):046:0> tab = ['ruby']
=> ["ruby"]
irb(main):047:0> tab
=> ["ruby"]
irb(main):048:0> tab.push('html')
=> ["ruby", "html"]
irb(main):049:0> tab.pop
=> "html"
irb(main):050:0> tab
=> ["ruby"]
irb(main):051:0> tab << 'css'
=> ["ruby", "css"]
irb(main):052:0> tab[0]
=> "ruby"
irb(main):053:0> tab[1]
=> "css"
irb(main):054:0> tab[2]
=> nil
```

### Ujemne indeksy - przeszukiwanie od końca
```
irb(main):056:0> [1, 2, "test", "super string #{user_email}"]
=> [1, 2, "test", "super string example@example.com"]
irb(main):057:0> tab = _
=> [1, 2, "test", "super string example@example.com"]
irb(main):058:0> tab[-1]
=> "super string example@example.com"
irb(main):059:0> tab[-2]
=> "test"
```

### Sortowanie
```
irb(main):065:0> tab = [3, 2, 1]
=> [3, 2, 1]
irb(main):066:0> tab.sort
=> [1, 2, 3]
irb(main):067:0> tab
=> [3, 2, 1]
irb(main):068:0> tab.sort!
=> [1, 2, 3]
irb(main):069:0> tab
=> [1, 2, 3]
```

### Losowanie próbek
```
irb(main):045:0> [1, 2, "test", "super string #{user_email}"].sample
=> 2
```

## Hash
Zbiór par (klucz, wartość)
klucz - symbol / string (najczęściej symbol)

### Deklaracja
```
irb(main):074:0> {}
=> {}
irb(main):075:0> {}.class
=> Hash
irb(main):076:0> hash = Hash.new
=> {}
irb(main):078:0> hash.class
=> Hash
```

### Zapełnianie elementami
```
irb(main):079:0> { :one => 1, :two => 2 }
=> {:one=>1, :two=>2}
```
```
irb(main):080:0> { one: 1, two: 2 }
=> {:one=>1, :two=>2}
```

### Dostęp
```
irb(main):080:0> { one: 1, two: 2 }
=> {:one=>1, :two=>2}
irb(main):082:0> hash = _
=> {:one=>1, :two=>2}
irb(main):083:0> hash[:one]
=> 1
irb(main):084:0> hash[:two]
=> 2
```
```
irb(main):085:0> ['Jakub', 27, 'BinarApps']
=> ["Jakub", 27, "BinarApps"]
irb(main):086:0> { name: 'Jakub', age: 27, company: 'BinarApps'}
=> {:name=>"Jakub", :age=>27, :company=>"BinarApps"}
```

### Przypisanie
```
irb(main):086:0> { name: 'Jakub', age: 27, company: 'BinarApps'}
=> {:name=>"Jakub", :age=>27, :company=>"BinarApps"}
irb(main):087:0> hsh = _
=> {:name=>"Jakub", :age=>27, :company=>"BinarApps"}
irb(main):088:0> hsh[:shoe_size]
=> nil
irb(main):089:0> hsh[:shoe_size] = 45
=> 45
irb(main):090:0> hsh
=> {:name=>"Jakub", :age=>27, :company=>"BinarApps", :shoe_size=>45}
```

### Duplikaty - brak możliwości
```
irb(main):107:0> { name: 'Jakub', age: 27, company: 'BinarApps'}
=> {:name=>"Jakub", :age=>27, :company=>"BinarApps"}
irb(main):108:0> hsh = _
=> {:name=>"Jakub", :age=>27, :company=>"BinarApps"}
irb(main):109:0> hsh[:name] = 'Michał'
=> "Michał"
irb(main):110:0> hsh
=> {:name=>"Michał", :age=>27, :company=>"BinarApps"}
```

### Dostęp klucz symbol
```
irb(main):091:0> hsh.keys
=> [:name, :age, :company, :shoe_size]
irb(main):092:0> hsh.values
=> ["Jakub", 27, "BinarApps", 45]
```

### Sprawdzanie czy coś jest
```
irb(main):093:0> hsh.has_key?(:age)
=> true
irb(main):094:0> hsh.has_key?(:One)
=> false
irb(main):095:0> hsh.has_value?('Jakub')
=> true
irb(main):096:0> hsh.has_value?('a')
=> false
```

# Konwersja typów
## Na string
```
irb(main):097:0> 123.to_s
=> "123"
irb(main):098:0> 123.to_s.class
=> String
irb(main):099:0> 45.34.to_s
=> "45.34"
irb(main):100:0> 45.34.to_s.class
=> String
irb(main):101:0> [1, 2, 3, 4].to_s.class
=> String
irb(main):102:0> [1, 2, 3, 4].to_s
=> "[1, 2, 3, 4]"
```

## Fallback (nie ma zdefiniowanego toStringa)
```
irb(main):103:0> Object.new.to_s
=> "#<Object:0x000055e5c5166498>"
```

## Na liczby
```
irb(main):104:0> "1234".to_i
=> 1234
irb(main):105:0> "1234".to_f
=> 1234.0
```

## Na array
```
irb(main):106:0> { name: 'Jakub', age: 27, company: 'BinarApps'}.to_a
=> [[:name, "Jakub"], [:age, 27], [:company, "BinarApps"]]
```

# Symbole
## Deklaracja
```
irb(main):035:0> :test
=> :test
irb(main):036:0> :test.class
=> Symbol
```

Dla zmiennych zawsze będzie inne
```
irb(main):030:0> "test".object_id
=> 47222671825160
irb(main):031:0> 3534343.object_id
=> 7068687
irb(main):032:0> "test".object_id
=> 47222671704320
```

Dla symboli object_id jest takie samo (do czasu zamknięcia sesji), nie zmieniają swojego 
```
irb(main):033:0> :test.object_id
=> 373148
irb(main):034:0> :test.object_id
=> 373148
```

## Po co?
Określanie kluczy (raz w pamięci, nie milion)

# Dobre praktyki

- Używać operatorów niesłownych (&&, ||) itd. (bo mają pierwszeństwo)
- 80 - 120 znaków na linijkę kodu
- Jeśli nie ma potrzeby na interpolację to pojedyncze quotation marki

# Bloki i wyjątki

## Bloki
W Ruby'm wszystko jest blokiem. Wartość zwracana to ostatnia instrukcja z bloku
```
irb(main):001:0> begin
irb(main):002:1>  2 + 2
irb(main):003:1>  3 + 3
irb(main):004:1> end
=> 6
```

## Wyjątki
### Zgłaszanie wyjątków
```
irb(main):005:0> a = 34
=> 34
irb(main):006:0> a.keys
Traceback (most recent call last):
        2: from /home/mchudzik/.rbenv/versions/2.5.1/bin/irb:11:in `<main>'
        1: from (irb):6
NoMethodError (undefined method `keys' for 34:Integer)
```
### Obsługa wyjątków
```
irb(main):007:0> begin
irb(main):008:1>  a = 2
irb(main):009:1>  a.keys
irb(main):010:1>  rescue NoMethodError
irb(main):011:1>   puts 'There was an error'
irb(main):012:1> end
There was an error
=> nil
```
puts zawsze zwraca nil

# Pliki z kodem
## Tworzenie
```
$ touch nazwa.rb
```

## Wywołanie
```
$ ruby nazwa.rb
```

# Komentarze
```
# To jest komentarz
```

# Wywoływanie metod
Można pomijać nawiasy
```
puts 'string'
puts('string')
```

# Wyrażenia warunkowe
Każdy blok jest wyrażeniem - zawsze zwraca wartość. Blok może się składać z instrukcji warunkowej.
```
math_working = if 2 + 2 == 4
  'is is equal'
else
  'it is not'
end
puts math_working
```

## I
```
if 2 + 2 == 4
  puts 'math works'
elsif 3 + 3 == 6
  puts 'it\'s 6'
else
  puts 'is\'s not working'
end
```

## II
```
if (2 + 3 == 4) then puts 'not 4'
elsif (3 + 3 == 6) then puts 'this is ok'
else puts 'other options'
end
```

## III
```
12 > 14 ? puts('is greater') : puts ('is not')  
```

## Modyfikator
```
# Modyfikator
username = "cokolwiek"
admin = true
puts "Witaj, #{cokolwiek}" if admin
```

# Pętle
```
6.times do
  puts "hi"
end
```
While, Until, Times
## Foreach
### Kolekcje
```
collection = [1, 2, 3]

for iter in collection
  puts iter
end
```
```
collection = [1, 2, 3, :test]
for item in collection
  puts iter
end
```
Pipe operator
```
collection.each do |item|
  puts item
end
```

### Range
```
for number in 1..10
  puts number
end
```

# Wyrażenia przeciwstawne
```
# Warunek przeciwstawny
if !false
  puts 'test ok'
end
```
```
if not false 
  puts 'test ok'
end
```
```
unless false
  puts 'test ok'
end
```

# Klasy i atrybuty
Koncept z rzeczywistości - jakiś obiekt.
Klasa - Wzorzec obiektu.

Klasy, moduły - CamelCase
zmienne, nazwy metod, symbole - snake_case

Obiekt klasy to jego instancja
```
class Animal
  attr_accessor :name, :age
end
```

## Atrybuty
Dane które przechowuje dana klasa
## Metody
Akscesory i inne. Operacje które może wykonać obiekt

```
class Animal
  attr_accessor :name, :age

  # Bezparametrowe
  def speak
    puts 'default'
  end

  # Parametrowe
  def speak2(sound)
    puts sound
  end
end
```


## Konstruktor
```
def initialize(name, age)
    @name = name
    @age = age
end
```

## Dziedziczenie
Możliwość dziedziczenia tylko z jednej klasy
```
class Animal
  attr_accessor :name, :age

  def initialize(name, age)
    @name = name
    @age = age
  end

  def speak
    puts 'default sound'
  end
end

class Dog < Animal
  def speak
    puts 'woof'
  end
end

class Cat < Animal
  def speak 
    puts 'meow'
  end
end

reksio = Dog.new('Reksio', 4)
reksio.speak

filemon = Cat.new('Filemon', 5)
filemon.speak
```
## Miksowanie - Kompozycja, domieszkowanie
```
module LivesInSea
  def swim
    puts 'swimming'
  end
end

module Mammal
  def lungs?
    true
  end
end

class Whale
  include LivesInSea
  include Mammal
end

whale = Whale.new
whale.swim
puts whale.lungs?
```

# Moduły
Sposób na organizację kodu
```
module Sports
  class Squash
    def what
      puts 'you play it with friends'
    end
  end
end

module Vegetables
  class Squash
    def  what
      puts 'i am a vegetable'
    end
  end
end

a = Vegetables::Squash.new
a.what

a = Sports::Squash.new
a.what
```

# Dokumentacja

Metoda z # przed to metoda wykonywana na instancji
Metoda z ! modyfikuje obiekt na którym jest wywołana (mutacja obiektu - zmiana jego stanu)
Metoda z ? zwraca boolean
```
irb(main):070:0> tab.empty?
=> false
irb(main):071:0> tab.any?
=> true
```

```
irb(main):072:0> tab = []
=> []
irb(main):073:0> tab.empty?
=> true
```

# Git, GitHub, RVM

## GIT
System kontroli wersji, pozwala przetrzymywać stany plików (konkretne wersje).
Jedna kopia lokalna, jedna w chmurze.
Commit do wprowadzania zmian w repo.
Ułatwia rozwiązywanie konfliktów.

### Inicjalizacja
```
$ git init
```

### Status
```
$ git status
```

### Logi
```
$ git log
```

### Dodawanie
```
$ git add -A
$ git add .
$ git add <nazwa_pliku>
```

### Commit
Lepiej więcej mniejszych commitów

```
$ git commit -m "Message"
```
#### Jak napisać dobry commit message
- Po angielsku
- Podział na 2 elementy
  -> nazwa (name) max. 80 znaków - jaki problem rozwiązuje (opcjonalnie używać tagów [add][fix])
  -> opis (description) - dwa entery poniżej name. Nie techniczne, dlaczego co zrobiliśmy, jaki problem rozwiązaliśmy. Historyjka rozwiązania problemu.
  Warto odnosić się do innych commitów(Np kiedy wykryto buga którego fixujemy)

  Wyprzedzamy kontrowersje, przyznajemy się do błedów.

## GitHub

### Pull request
Sprawdzanie kodu przed zmergowaniem do masteru przez osobę trzecią.

### Squash (?)

### Remote
```
$ git remote add <serwer_itd>
```

### Pushowanie
```
$ git push origin master
```

### Branch - praca w zespole
Gałęzie rozwojowe. Podział jak dodajemy feature, naprawiamy bugi itd...
Zazwyczaj na początku branch staging / beta. - tesotowanie i developerka.
Feature'y dodajemy od stagingu, idzie obok mastera.
Master - kod idzie na produkcje

#### Podglądanie branch'y
```
$ git branch
```

#### Tworzenie i przeniesienie na branch
```
$ git checkout -b <name>
```
#### Tworzenie
```
$ git branch <name>
```
#### Przeniesienie na brancha
```
$ git checkout <name>
```
#### Zapisywanie zmian w masterze np
```
$ git merge <name>
```
#### Pobieranie zmian
```
$ git pull
```
#### Usuwanie branchy
```
$ git branch -d <name>
```
## RVM
Ruby Version Manager
Zarządzanie wersjami ruby'ego - wydziela na to osobną przestrzeń. Projekty mogą mieć inne wersje, dlatego przydaje się opcja, żeby móc obsługiwać parę wersji.
```
$ rvm list #=> listuje wersje ruby'ego
.
.
.
```

### Gemsety
Gem - biblioteka
Gemset - zestaw bibliotek

# Podstawy Ruby on Rails
## Przydatne linki
- http://guides.rubyonrails.org/
- http://api.rubyonrails.org/

## Zasoby
public/ - statyczne strony
Jeśli request nie idzie na zasób który jest statyczny to przekazywane dalej do controllera.

Kontroler - klasa - logika aplikacji
Model - klasa - reprezentuje dane
View - widoki

Bundler - menadżer gemów
```
$ gem install bundler
```

## Architektura
Wzór projektowy - MVC(Model, View, Controller)
## Tworzenie apki
```
$ rails new <nazwa>
```
## Konsola railsowa
```
$ rails console
$ rails c
```
## Model, Baza danych

### Model
Pliki snake_case nazwa.

Klasa. Dziedziczy po ActiveRecord::Base(ORM - Object Relational Model) - pozwala na rzutowanie na bazy danych.
Budowaniem zapytań zajmuje się ORM.
Base - Klasa z której dziedziczą wszystkie modele

Model odzwierciedla tablicę w bazie danych.
Rekord to instancja obiektu. Nie musimy tworzyć atrybutów danej klasy. Są one mapowane z tablicy.
Tablica musi odpowiadać modelowi.

Model - Post (Zawsze w liczbie pojedynczej)
Tablic - Posts (Zawsze w liczbie mnogiej)

Generowanie migracji
```
$ rails generate migration create_<model>
$ rails generate migration CreateAuthors name:string surname:string age:integer

```
Wprowadzanie migracji
```
$ rails db:migrate
```
Wycofywanie migracji
```
$ rails db:rollback
```
Migracja - klasa implementująca metodę change

Mass initializer
```
2.5.1 :012 > Post.new(title: 'drugi post', content: 'inny kontent', author: 'drugi autor')
```

Deklaracja metody statycznej - self. przed metodą
```
def self.nazwa_metody
end
```


Tworzenie obiektu klasy
```
Klasa.new
Klasa.save
```
Zamiast new i save
```
Klasa.create
```

Sprawdzenie czy zapisanie
```
zmienna_przechowująca.persisted?
```

Wyszukiwanie
```
Klasa.all           #=> Wszystkie instancje zwraca ActiveRecord::Relation (Array na sterydach)
Klasa.all.count     #=> Ilość obiektów
Klasa.count         #=> Ilość obiektów
Klasa.first
Klasa.last
Klasa.find(<integer>)
Klasa.where(symbol: <czego_szukamy>)    #=> Można używać logiki
2.5.1 :028 > Post.where('created_at > ?', 2018-07-10)
```

```
Time.now
DateTime.now
DateTime.now - 2.weeks
2.weeks.ago
56.minuts.ago
```

Edycja obiektów
```
2.5.1 :034 > post = Post.last
  Post Load (0.3ms)  SELECT  "posts".* FROM "posts" ORDER BY "posts"."id" DESC LIMIT ?  [["LIMIT", 1]]
 => #<Post id: 3, title: "trzeci post", content: "inny kontent", author: "drugi autor", created_at: "2018-07-10 11:09:47", updated_at: "2018-07-10 11:09:47"> 
2.5.1 :035 > post.title = 'zmiana'
 => "zmiana" 
2.5.1 :036 > post
 => #<Post id: 3, title: "zmiana", content: "inny kontent", author: "drugi autor", created_at: "2018-07-10 11:09:47", updated_at: "2018-07-10 11:09:47"> 
2.5.1 :037 > post.save
   (0.1ms)  begin transaction
  Post Update (2.6ms)  UPDATE "posts" SET "title" = ?, "updated_at" = ? WHERE "posts"."id" = ?  [["title", "zmiana"], ["updated_at", "2018-07-10 11:31:03.001848"], ["id", 3]]
   (23.2ms)  commit transaction
 => true 
2.5.1 :038 > post.update(title: 'druga zmiana', content: 'inny kontent')
   (0.1ms)  begin transaction
  Post Update (3.1ms)  UPDATE "posts" SET "title" = ?, "updated_at" = ? WHERE "posts"."id" = ?  [["title", "druga zmiana"], ["updated_at", "2018-07-10 11:31:37.868989"], ["id", 3]]
   (22.0ms)  commit transaction
 => true 
```
Edycja obiektów - wszystkie instancje dla klasy
```
2.5.1 :040 > Post.update_all(author: 'zmieniony')
  Post Update All (23.2ms)  UPDATE "posts" SET "author" = 'zmieniony'
 => 3 
```

Usuwanie obiektów
```
2.5.1 :041 > Post.find(1)
  Post Load (0.3ms)  SELECT  "posts".* FROM "posts" WHERE "posts"."id" = ? LIMIT ?  [["id", 1], ["LIMIT", 1]]
 => #<Post id: 1, title: "cokolwiek", content: "content", author: "zmieniony", created_at: "2018-07-10 11:00:15", updated_at: "2018-07-10 11:00:15"> 
2.5.1 :042 > post = _
 => #<Post id: 1, title: "cokolwiek", content: "content", author: "zmieniony", created_at: "2018-07-10 11:00:15", updated_at: "2018-07-10 11:00:15"> 
2.5.1 :043 > post.destroy
   (0.1ms)  begin transaction
  Post Destroy (2.5ms)  DELETE FROM "posts" WHERE "posts"."id" = ?  [["id", 1]]
   (25.7ms)  commit transaction
 => #<Post id: 1, title: "cokolwiek", content: "content", author: "zmieniony", created_at: "2018-07-10 11:00:15", updated_at: "2018-07-10 11:00:15"> 
```

id - integer auto_increment primary_key
primary_key - identyfikuje obiekty, każdy jest unikalny

Baza danych SQLite

4 Role:
- Reprezentacja danych (atrybuty)
- Porozumiewanie z bazą danych
- Walidacja danych
- Reprezentacja asocjacji (Powiązanie z innymi modelami w systemi - w jaki sposób itd)

Walidacje - sprawdzanie danych
Nie pozwoli zapisać jeśli któraś z walidacji nie jest spełniona
- http://guides.rubyonrails.org/active_record_validations.html
```
class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :title, uniqueness: true
  validates :title, length: { maximum: 80 }
  validates :content, presence: true
  validates :content, length: { in: 10..500 }
  validates :author, presence: true
end
```

~ Walidator formatu - z wyrażeniem regularnym (regex)
W errors przechowywane wiadomości błędów

```
2.5.1 :001 > post = Post.new
 => #<Post id: nil, title: nil, content: nil, author: nil, created_at: nil, updated_at: nil> 
2.5.1 :002 > post.save
   (0.1ms)  begin transaction
  Post Exists (0.2ms)  SELECT  1 AS one FROM "posts" WHERE "posts"."title" IS NULL LIMIT ?  [["LIMIT", 1]]
   (0.2ms)  rollback transaction
 => false 
2.5.1 :003 > post.errors
 => #<ActiveModel::Errors:0x00007f98bc908628 @base=#<Post id: nil, title: nil, content: nil, author: nil, created_at: nil, updated_at: nil>, @messages={:title=>["can't be blank"], :content=>["can't be blank", "is too short (minimum is 10 characters)"], :author=>["can't be blank"]}, @details={:title=>[{:error=>:blank}], :content=>[{:error=>:blank}, {:error=>:too_short, :count=>10}], :author=>[{:error=>:blank}]}> 
2.5.1 :004 > post.errors.full_messages
 => ["Title can't be blank", "Content can't be blank", "Content is too short (minimum is 10 characters)", "Author can't be blank"] 
 2.5.1 :005 > post.errors.messages
 => {:title=>["can't be blank"], :content=>["can't be blank", "is too short (minimum is 10 characters)"], :author=>["can't be blank"]} 
 2.5.1 :006 > post.errors.messages.inspect
 => "{:title=>[\"can't be blank\"], :content=>[\"can't be blank\", \"is too short (minimum is 10 characters)\"], :author=>[\"can't be blank\"]}" 
```

Callback
```
before_create :annotate_author

def annotate_author
  self.author = "#{author} from Binar::Apps"
end
```

Scope
```
# Wyszukiwanie ze specyficznymi parametrami
scope :old, -> { where("created_at < ?", 40.minutes.ago) }
```

Asocjacje - relacje między tablicami
post - autor
1 - 1
1 - wiele
wiele - wiele (dodatkowa tablica do przechowywania powiązań)

Nie modyfikujemy migracji, która weszła w życie

app/models
### Baza danych

## Kontroler, widoki

### Kontroler

### Widoki

# Ciekawostki

- Garbage Collector istnieje (automatyczna dealokacja pamięci)