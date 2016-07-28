class CreateStates < ActiveRecord::Migration[5.0]
  def up
    create_table :states do |t|
      t.string :name
      t.string :abbreviation
      t.boolean :swing, default: false
      t.timestamps
    end
    execute 'INSERT INTO states (name,abbreviation,created_at,updated_at) VALUES ("Alabama", "AL",now(),now()), ("Alaska", "AK",now(),now()), ("Arizona", "AZ",now(),now()), ("Arkansas", "AR",now(),now()), ("California", "CA",now(),now()), ("Colorado", "CO",now(),now()), ("Connecticut", "CT",now(),now()), ("Delaware", "DE",now(),now()), ("Florida", "FL",now(),now()), ("Georgia", "GA",now(),now()), ("Hawaii", "HI",now(),now()), ("Idaho", "ID",now(),now()), ("Illinois", "IL",now(),now()), ("Indiana", "IN",now(),now()), ("Iowa", "IA",now(),now()), ("Kansas", "KS",now(),now()), ("Kentucky", "KY",now(),now()), ("Louisiana", "LA",now(),now()), ("Maine", "ME",now(),now()), ("Maryland", "MD",now(),now()), ("Massachusetts", "MA",now(),now()), ("Michigan", "MI",now(),now()), ("Minnesota", "MN",now(),now()), ("Mississippi", "MS",now(),now()), ("Missouri", "MO",now(),now()), ("Montana", "MT",now(),now()), ("Nebraska", "NE",now(),now()), ("Nevada", "NV",now(),now()), ("New Hampshire", "NH",now(),now()), ("New Jersey", "NJ",now(),now()), ("New Mexico", "NM",now(),now()), ("New York", "NY",now(),now()), ("North Carolina", "NC",now(),now()), ("North Dakota", "ND",now(),now()), ("Ohio", "OH",now(),now()), ("Oklahoma", "OK",now(),now()), ("Oregon", "OR",now(),now()), ("Pennsylvania", "PA",now(),now()), ("Rhode Island", "RI",now(),now()), ("South Carolina", "SC",now(),now()), ("South Dakota", "SD",now(),now()), ("Tennessee", "TN",now(),now()), ("Texas", "TX",now(),now()), ("Utah", "UT",now(),now()), ("Vermont", "VT",now(),now()), ("Virginia", "VA",now(),now()), ("Washington", "WA",now(),now()), ("Washington D.C.", "DC",now(),now()), ("West Virginia", "WV",now(),now()), ("Wisconsin", "WI",now(),now()), ("Wyoming", "WY",now(),now());'
  end

  def down
    drop_table :states
  end
end
