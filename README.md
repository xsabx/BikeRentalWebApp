# Vides uzstādīšana

### 1. Jābūt instalētam Ruby (3.3.0)
To var izdarīt šeit: https://rubyinstaller.org/downloads/.
Lai apskatītos esošo ruby versiju, izmanto komandu:
```bash
ruby -v
```

### 2. Jābūt instalētam Rails
To var izdarīt ar koamndu:
```bash
gem install rails
```

### 3. Instalē Bundler
```bash
gem install bundler
```

Kad šie soļo izdarīti, tālāk tiek uzstādīts projekts.

## Soļi

### 1. Klonē repositoriju
```bash
git clone https://github.com/xsabx/BikeRentalWebApp.git
```

### 2. Dodies uz projekta direktoriju 
```bash
cd <project-directory>
```
Šeit var arī atvērt editoru (piemēram, VScode ar komandu "code .")

### 3. Veic nepieciešamās instalācijas projektā
```bash
bundle install
```

### 4. Izveido datubāzi
```bash
rails db:create
rails db:migrate
rails db:seed
```

### 5. Startē projektu
```bash
rails server
```

Projekts būs pieejams [http://localhost:3000](http://localhost:3000).

Ja uz Windows netiek izmantota Windows Linux Subsistēma, terminālis jāatver kā administratoram, lai būtu visas nepieciešamas tiesības.

# Par WebAplikāciju

Šajā WebAplikācijā nereģistrējies lietotājs var apskatīties visus pieejamos velosipēdus gan konkrētajā dienā, gan sevis izvēlētā datuma intervālā. Lai rezervētu velo, lietotājam nepieciešamas reģistrēties vai ielagoties. Lietotājs var aplūkot savas rezervācijas uzspiežot pogu "My rentals" un turpat tās arī atteikt/dzēst.




