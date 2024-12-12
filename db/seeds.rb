puts "✨ Seeding Publishers! ✨"
publishers = [
  { name: "Pink Sparkle Press", email: "contact@sparklepress.com", url: "https://sparklepress.com" },
  { name: "Fluffy Cloud Publications", email: "hello@fluffycloud.com", url: "https://fluffycloud.com" },
  { name: "Sugarcube Editions", email: "support@sugarcube.com", url: "https://sugarcube.com" },
  { name: "Twinkling Star Publishing", email: "info@twinklingstar.com", url: "https://twinklingstar.com" }
]
publishers.each { |pub| Publisher.create!(pub) }

puts "🌸 Seeding Authors! 🌸"
authors = [
  { firstname: "Aiko", lastname: "Hoshino", artistname: "StarryCutie", bio: "Lover of cozy stories and pastel vibes!" },
  { firstname: "Felix", lastname: "Beaumont", artistname: "FemmeFox", bio: "Writing soft romance and femboy adventures." },
  { firstname: "Jun", lastname: "Takahashi", artistname: "CherryBlossom", bio: "Dreamer, poet, and occasional mischief-maker." },
  { firstname: "Luna", lastname: "Miyazaki", artistname: "MoonlitDream", bio: "Fantasy worlds are my playground." },
  { firstname: "Haruto", lastname: "Kobayashi", artistname: "SunnyBoy", bio: "Soft moments in everyday life." },
  { firstname: "Elliot", lastname: "Frost", artistname: "SnowyFox", bio: "Exploring love through magical tales." },
  { firstname: "Sophia", lastname: "Winters", artistname: "CozyCuddles", bio: "Snuggly stories for rainy days." },
  { firstname: "Kai", lastname: "Tanaka", artistname: "OceanBreeze", bio: "Romantic tales with a sea breeze." },
  { firstname: "Noah", lastname: "Hayes", artistname: "StarGazer", bio: "Dreaming under the night sky." },
  { firstname: "Mika", lastname: "Ito", artistname: "SoftCloud", bio: "Fluffy tales for gentle hearts." },
  { firstname: "Rin", lastname: "Suzuki", artistname: "BlossomBoy", bio: "Pastel dreams and tender stories." },
  { firstname: "Emi", lastname: "Yamamoto", artistname: "CherryPastel", bio: "Love in soft hues." },
  { firstname: "Leo", lastname: "Vega", artistname: "DandyLion", bio: "Writing about sweet, blooming romances." },
  { firstname: "Sora", lastname: "Fujimoto", artistname: "SkyDreamer", bio: "Adventures in the clouds." },
  { firstname: "Avery", lastname: "Quinn", artistname: "ShyFox", bio: "Gentle tales of quiet love." },
  { firstname: "Nico", lastname: "Rivera", artistname: "Moonbeam", bio: "Romance under the stars." },
  { firstname: "Yuki", lastname: "Nakamura", artistname: "FrostyBoy", bio: "Snowy adventures and warm hearts." },
  { firstname: "Asa", lastname: "Takahashi", artistname: "Daybreak", bio: "Hopeful tales of love and light." },
  { firstname: "Kira", lastname: "Yamashita", artistname: "TwinkleFox", bio: "Whimsical romances and twinkling stars." },
  { firstname: "Riku", lastname: "Hirano", artistname: "MorningDew", bio: "Tender moments in the morning light." }
]
authors.each { |auth| Author.create!(auth) }

puts "💖 Seeding Categories! 💖"
categories = [
  { name: "Romance", description: "For hearts that flutter and cheeks that blush." },
  { name: "Fantasy", description: "Magical lands and whimsical adventures await." },
  { name: "Slice of Life", description: "Everyday cuteness and soft moments." },
  { name: "Adventure", description: "Exciting journeys and daring heroes." },
  { name: "Mystery", description: "Unraveling secrets with a touch of charm." },
  { name: "Sci-Fi", description: "Soft futures with a human touch." },
  { name: "Drama", description: "Emotional tales with a pastel glow." },
  { name: "Historical", description: "Love stories from the past." },
  { name: "Comedy", description: "Laughs and giggles in a fluffy world." },
  { name: "Young Adult", description: "Coming-of-age stories with a tender touch." }
]
categories.each { |cat| Category.create!(cat) }

puts "📚 Seeding Books with Authors and Categories! 📚"
books = [
  { title: "The Femboy Knight", description: "A brave and adorable knight protects the kingdom with charm and fluff.", isbn: "1234567890", price: 12.99, publisher_id: Publisher.find_by(name: "Pink Sparkle Press").id, amount: 20,
    authors: [ Author.find_by(artistname: "FemmeFox") ], categories: [ Category.find_by(name: "Fantasy"), Category.find_by(name: "Romance") ] },
  { title: "Cherry Blossoms in Spring", description: "A soft and romantic tale of blooming love.", isbn: "0987654321", price: 14.99, publisher_id: Publisher.find_by(name: "Fluffy Cloud Publications").id, amount: 15,
    authors: [ Author.find_by(artistname: "CherryBlossom") ], categories: [ Category.find_by(name: "Romance"), Category.find_by(name: "Drama") ] },
  { title: "Magical Tea Party", description: "Witches, femboys, and the cutest tea party in all the realms.", isbn: "1112131415", price: 10.99, publisher_id: Publisher.find_by(name: "Sugarcube Editions").id, amount: 25,
    authors: [ Author.find_by(artistname: "SnowyFox") ], categories: [ Category.find_by(name: "Fantasy"), Category.find_by(name: "Comedy") ] },
  { title: "Starlit Serenade", description: "A romance under the twinkling night sky.", isbn: "2223334445", price: 13.50, publisher_id: Publisher.find_by(name: "Twinkling Star Publishing").id, amount: 18,
    authors: [ Author.find_by(artistname: "MoonlitDream") ], categories: [ Category.find_by(name: "Romance"), Category.find_by(name: "Young Adult") ] },
  { title: "Fluffy Adventures", description: "Join a fluffy femboy on a magical journey.", isbn: "3334445556", price: 9.99, publisher_id: Publisher.find_by(name: "Pink Sparkle Press").id, amount: 30,
    authors: [ Author.find_by(artistname: "FemmeFox") ], categories: [ Category.find_by(name: "Adventure"), Category.find_by(name: "Slice of Life") ] },
  { title: "Cuddly Chronicles", description: "A tale of love, warmth, and cuddles.", isbn: "4445556667", price: 11.99, publisher_id: Publisher.find_by(name: "Fluffy Cloud Publications").id, amount: 10,
    authors: [ Author.find_by(artistname: "CozyCuddles") ], categories: [ Category.find_by(name: "Romance"), Category.find_by(name: "Slice of Life") ] },
  { title: "Whispering Woods", description: "A magical adventure through an enchanted forest.", isbn: "5556667778", price: 15.49, publisher_id: Publisher.find_by(name: "Sugarcube Editions").id, amount: 12,
    authors: [ Author.find_by(artistname: "MoonlitDream") ], categories: [ Category.find_by(name: "Fantasy"), Category.find_by(name: "Adventure") ] },
  { title: "Blossoms and Stars", description: "A tender romance amidst falling cherry blossoms.", isbn: "6667778889", price: 12.75, publisher_id: Publisher.find_by(name: "Twinkling Star Publishing").id, amount: 16,
    authors: [ Author.find_by(artistname: "CherryBlossom") ], categories: [ Category.find_by(name: "Romance"), Category.find_by(name: "Fantasy") ] },
  { title: "Soft Summer Nights", description: "Love blooms under the summer stars.", isbn: "7778889990", price: 14.50, publisher_id: Publisher.find_by(name: "Pink Sparkle Press").id, amount: 20,
    authors: [ Author.find_by(artistname: "OceanBreeze") ], categories: [ Category.find_by(name: "Romance"), Category.find_by(name: "Young Adult") ] },
  { title: "Moonlit Magic", description: "A witch and a femboy find love under the full moon.", isbn: "8889990001", price: 16.99, publisher_id: Publisher.find_by(name: "Fluffy Cloud Publications").id, amount: 25,
    authors: [ Author.find_by(artistname: "SnowyFox") ], categories: [ Category.find_by(name: "Fantasy"), Category.find_by(name: "Romance") ] },
  { title: "Pastel Dreams", description: "A collection of heartwarming stories in pastel hues.", isbn: "9990001112", price: 13.99, publisher_id: Publisher.find_by(name: "Sugarcube Editions").id, amount: 22,
    authors: [ Author.find_by(artistname: "CherryPastel") ], categories: [ Category.find_by(name: "Romance"), Category.find_by(name: "Slice of Life") ] },
  { title: "The Gentle Prince", description: "A femboy prince shows strength through kindness.", isbn: "0001112223", price: 11.50, publisher_id: Publisher.find_by(name: "Twinkling Star Publishing").id, amount: 18,
    authors: [ Author.find_by(artistname: "DandyLion") ], categories: [ Category.find_by(name: "Romance"), Category.find_by(name: "Fantasy") ] },
  { title: "Frosty Tales", description: "Warm love stories set in snowy landscapes.", isbn: "1112223334", price: 10.99, publisher_id: Publisher.find_by(name: "Pink Sparkle Press").id, amount: 24,
    authors: [ Author.find_by(artistname: "FrostyBoy") ], categories: [ Category.find_by(name: "Romance"), Category.find_by(name: "Fantasy") ] },
  { title: "Twinkling Twilight", description: "Love glows as twilight falls.", isbn: "2223334445", price: 12.99, publisher_id: Publisher.find_by(name: "Fluffy Cloud Publications").id, amount: 19,
    authors: [ Author.find_by(artistname: "FemmeFox") ], categories: [ Category.find_by(name: "Romance"), Category.find_by(name: "Young Adult") ] },
  { title: "Dewdrop Dreams", description: "Soft stories of morning light and love.", isbn: "3334445556", price: 10.75, publisher_id: Publisher.find_by(name: "Sugarcube Editions").id, amount: 21,
    authors: [ Author.find_by(artistname: "MorningDew") ], categories: [ Category.find_by(name: "Romance"), Category.find_by(name: "Slice of Life") ] },
  { title: "Celestial Love", description: "Romance among the stars.", isbn: "4445556667", price: 15.99, publisher_id: Publisher.find_by(name: "Twinkling Star Publishing").id, amount: 20,
    authors: [ Author.find_by(artistname: "Moonbeam") ], categories: [ Category.find_by(name: "Romance"), Category.find_by(name: "Sci-Fi") ] },
  { title: "Blush and Bloom", description: "A romantic journey through blooming gardens.", isbn: "5556667778", price: 12.50, publisher_id: Publisher.find_by(name: "Pink Sparkle Press").id, amount: 17,
    authors: [ Author.find_by(artistname: "CherryPastel") ], categories: [ Category.find_by(name: "Romance"), Category.find_by(name: "Young Adult") ] },
  { title: "Velvet Visions", description: "Dreams of romance in velvety darkness.", isbn: "6667778889", price: 14.25, publisher_id: Publisher.find_by(name: "Fluffy Cloud Publications").id, amount: 14,
    authors: [ Author.find_by(artistname: "FemmeFox") ], categories: [ Category.find_by(name: "Romance"), Category.find_by(name: "Drama") ] },
  { title: "Sunshine Serenade", description: "A serenade to the gentle warmth of the sun.", isbn: "7778889990", price: 13.99, publisher_id: Publisher.find_by(name: "Pink Sparkle Press").id, amount: 22,
    authors: [ Author.find_by(artistname: "CozyCuddles") ], categories: [ Category.find_by(name: "Romance"), Category.find_by(name: "Slice of Life") ] },
  { title: "Golden Horizon", description: "An adventurous tale of discovery and love.", isbn: "8889990001", price: 15.50, publisher_id: Publisher.find_by(name: "Fluffy Cloud Publications").id, amount: 20,
    authors: [ Author.find_by(artistname: "OceanBreeze") ], categories: [ Category.find_by(name: "Adventure"), Category.find_by(name: "Romance") ] },
  { title: "Echoes of Love", description: "A romantic saga that transcends time.", isbn: "9990001112", price: 14.25, publisher_id: Publisher.find_by(name: "Sugarcube Editions").id, amount: 25,
    authors: [ Author.find_by(artistname: "Moonbeam") ], categories: [ Category.find_by(name: "Romance"), Category.find_by(name: "Historical") ] },
  { title: "Morning Glow", description: "Love stories wrapped in the glow of dawn.", isbn: "0001112223", price: 11.75, publisher_id: Publisher.find_by(name: "Twinkling Star Publishing").id, amount: 18,
    authors: [ Author.find_by(artistname: "Daybreak") ], categories: [ Category.find_by(name: "Romance"), Category.find_by(name: "Slice of Life") ] },
  { title: "Lullabies of the Moon", description: "Soft tales under the moonlit sky.", isbn: "1112223334", price: 13.49, publisher_id: Publisher.find_by(name: "Pink Sparkle Press").id, amount: 24,
    authors: [ Author.find_by(artistname: "FrostyBoy") ], categories: [ Category.find_by(name: "Romance"), Category.find_by(name: "Fantasy") ] },
  { title: "Fields of Lavender", description: "A tender romance amidst lavender fields.", isbn: "2223334445", price: 12.99, publisher_id: Publisher.find_by(name: "Fluffy Cloud Publications").id, amount: 19,
    authors: [ Author.find_by(artistname: "TwinkleFox") ], categories: [ Category.find_by(name: "Romance"), Category.find_by(name: "Young Adult") ] }
]
books.each { |book| Book.create!(book) }
