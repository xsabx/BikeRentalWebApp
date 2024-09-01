# Setup Requirements

### 1. Verify Ruby Installation
```bash
ruby -v
```

### 2. Install Rails (if not already installed)
```bash
gem install rails
```

### 3. Install Bundler
```bash
gem install bundler
```

Once these steps are completed, proceed with setting up the project.

## Steps

### 1. Clone the Repository
```bash
git clone https://github.com/xsabx/BikeRentalWebApp.git
```

### 2. Navigate into the project directory
```bash
cd <project-directory>
```

### 3. Install Dependencies
```bash
bundle install
```

### 4. Setup the Database
```bash
rails db:create
rails db:migrate
rails db:seed
```

### 5. Run the Project
```bash
rails server
```

Access the project at [http://localhost:3000](http://localhost:3000).


