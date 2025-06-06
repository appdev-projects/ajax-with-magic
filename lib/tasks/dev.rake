desc "Fill the database tables with some sample data"
task({ sample_data: :environment }) do
  if Rails.env.development?
    Message.destroy_all
    Chat.destroy_all

    puts "Creating sample data..."

    # Create Tokyo chat
    tokyo_chat = Chat.create!(subject: "Tokyo Travel Questions")
    traveler = Haikunator.haikunate(0)
    local_guide = Haikunator.haikunate(0)
    shop_owner = Haikunator.haikunate(0)

    tokyo_convo = [
      { author: traveler, content: "Hello! I'm planning a trip to Tokyo next month. Any recommendations for must-visit places?" },
      { author: local_guide, content: "Welcome! Tokyo has so much to offer. You should definitely visit Shibuya Crossing, Tokyo Tower, and Senso-ji Temple." },
      { author: traveler, content: "Thanks! How many days would you recommend staying to see the main attractions?" },
      { author: local_guide, content: "I'd suggest at least 5 days to see the highlights without rushing. Tokyo is huge!" },
      { author: traveler, content: "That makes sense. What about transportation? Is the subway easy to navigate?" },
      { author: local_guide, content: "The subway system is extensive but very efficient. Get a Suica or Pasmo card to make travel easier. Google Maps works great here too." },
      { author: traveler, content: "Perfect. And what area would you recommend staying in?" },
      { author: local_guide, content: "Shinjuku or Shibuya are great for first-timers - central, lively, and well-connected by subway." },
      { author: traveler, content: "I've heard Tokyo can be expensive. Any budget-friendly tips?" },
      { author: local_guide, content: "Convenience stores like 7-Eleven have surprisingly good, affordable food. Also, many small ramen shops offer excellent meals for under 1000 yen." },
      { author: traveler, content: "Speaking of food, what dishes should I definitely try?" },
      { author: local_guide, content: "Besides sushi and ramen, try okonomiyaki, takoyaki, and don't miss a proper Japanese breakfast with grilled fish and miso soup." },
      { author: traveler, content: "Are there any local customs I should be aware of?" },
      { author: local_guide, content: "Don't tip - it's not expected. Remove shoes when entering homes and some restaurants. Bowing is customary but a slight nod is fine for tourists." },
      { author: traveler, content: "I'd love to buy some souvenirs. Where's good for shopping?" },
      { author: shop_owner, content: "If you're looking for traditional crafts, visit Asakusa area near Senso-ji. For electronics, Akihabara is the place to go." },
      { author: traveler, content: "What about day trips from Tokyo?" },
      { author: local_guide, content: "Kamakura, Nikko, and Hakone are all great day trips. Mt. Fuji is possible but better as an overnight stay." },
      { author: traveler, content: "Is it difficult to get by without speaking Japanese?" },
      { author: local_guide, content: "In tourist areas, you'll be fine with English. Having a translation app helps. Many signs are in English too, especially on the subway." },
      { author: traveler, content: "Thanks so much for all your help! I'm really excited about my trip now." }
    ]

    # Create Paris chat
    paris_chat = Chat.create!(subject: "Paris Adventure Planning")
    tourist = Haikunator.haikunate(0)
    cafe_owner = Haikunator.haikunate(0)
    taxi_driver = Haikunator.haikunate(0)

    paris_convo = [
      { author: tourist, content: "Bonjour! I'm visiting Paris for the first time next week. What should I expect?" },
      { author: cafe_owner, content: "Bonjour! Paris is beautiful in spring. The cafés are filled with people enjoying the sunshine." },
      { author: tourist, content: "I'm excited! Is it true that Parisians don't like when tourists speak English?" },
      { author: cafe_owner, content: "It's a myth. Most appreciate if you start with 'Bonjour' and then try some basic French, but many speak English, especially in tourist areas." },
      { author: tourist, content: "That's reassuring. What's the best way to see the Eiffel Tower without long lines?" },
      { author: cafe_owner, content: "Book tickets online in advance, and consider going early morning or evening. The view at sunset is magical." },
      { author: tourist, content: "Should I stay near the Eiffel Tower or is there a better neighborhood?" },
      { author: cafe_owner, content: "Le Marais or Saint-Germain-des-Prés are more central and charming. You'll feel like you're in the real Paris." },
      { author: tourist, content: "What about getting around? Is the Metro easy to use?" },
      { author: taxi_driver, content: "The Metro is very efficient and goes everywhere. Buy a carnet of 10 tickets to save money. Avoid rush hours if possible." },
      { author: tourist, content: "Any restaurants you'd recommend for authentic French cuisine?" },
      { author: cafe_owner, content: "Avoid restaurants near major attractions. Try Bistrot Paul Bert or Au Petit Tonneau for authentic experiences without the tourist prices." },
      { author: tourist, content: "What's a typical French breakfast?" },
      { author: cafe_owner, content: "Croissant or pain au chocolat with café crème. French breakfast is light - we save room for lunch and dinner!" },
      { author: tourist, content: "Are there any hidden gems most tourists miss?" },
      { author: cafe_owner, content: "Visit Parc des Buttes-Chaumont or Canal Saint-Martin area. The covered passages like Galerie Vivienne are also beautiful and less crowded." },
      { author: tourist, content: "Is the Louvre worth it? I've heard it's overwhelming." },
      { author: cafe_owner, content: "It's massive! Unless you're a big art enthusiast, consider Musée d'Orsay or Musée de l'Orangerie instead. More manageable and equally impressive." },
      { author: tourist, content: "What about day trips from Paris?" },
      { author: taxi_driver, content: "Versailles is the classic choice. Giverny (Monet's garden) is beautiful in spring and summer. Reims for champagne tasting is excellent too." },
      { author: tourist, content: "Thank you both for all the advice! I feel much more prepared now." }
    ]

    # Create New York chat
    nyc_chat = Chat.create!(subject: "NYC First Timer")
    visitor = Haikunator.haikunate(0)
    local = Haikunator.haikunate(0)
    hotel_staff = Haikunator.haikunate(0)

    nyc_convo = [
      { author: visitor, content: "Hi! I'm coming to New York for 5 days next week. It's my first visit!" },
      { author: local, content: "Awesome! NYC is incredible. What are you most interested in seeing?" },
      { author: visitor, content: "Definitely the main attractions - Statue of Liberty, Empire State Building, Central Park. Is that doable in 5 days?" },
      { author: local, content: "Absolutely! 5 days is perfect for a first visit. Add in Times Square, the High Line, and a museum or two." },
      { author: visitor, content: "Great! Where should I stay? Is Manhattan the best option?" },
      { author: hotel_staff, content: "Manhattan is convenient but expensive. Brooklyn (Williamsburg or Park Slope) offers better value and is just a short subway ride away." },
      { author: visitor, content: "Speaking of subways, are they safe? I've heard mixed things." },
      { author: local, content: "The subway is generally safe, especially during daytime and evening hours. It's also by far the best way to get around - traffic is terrible." },
      { author: visitor, content: "Do I need to get tickets for attractions in advance?" },
      { author: hotel_staff, content: "Definitely pre-book tickets for the Statue of Liberty, Empire State Building, and any Broadway shows you want to see." },
      { author: visitor, content: "What's a good area for restaurants? I love trying different foods." },
      { author: local, content: "NYC has amazing food everywhere! The East Village has great variety. Chinatown for authentic Asian, Little Italy for Italian, and don't miss the food halls like Chelsea Market." },
      { author: visitor, content: "Is it true that New Yorkers are rude?" },
      { author: local, content: "Not rude, just busy! We move quickly and value efficiency. Don't stop in the middle of the sidewalk, and you'll be fine." },
      { author: visitor, content: "How much should I budget per day for food and activities?" },
      { author: hotel_staff, content: "For a moderate budget, around $100-150 per day covers food and basic attractions. Add more if you want Broadway shows or fine dining." },
      { author: visitor, content: "Any neighborhoods I should avoid for safety reasons?" },
      { author: local, content: "Most tourist areas are quite safe. Just use common sense, especially late at night. The subway is fine but be aware of your surroundings." },
      { author: visitor, content: "What's something uniquely New York that I shouldn't miss?" },
      { author: local, content: "Walk across the Brooklyn Bridge at sunset, then enjoy the Manhattan skyline view from Brooklyn Bridge Park. Also, grab a bagel with lox for breakfast at least once!" },
      { author: visitor, content: "Thanks so much for all the tips! I'm so excited to experience New York." }
    ]

    # Create messages with realistic timestamps
    [
      { chat: tokyo_chat, conversation: tokyo_convo },
      { chat: paris_chat, conversation: paris_convo },
      { chat: nyc_chat, conversation: nyc_convo }
    ].each do |chat_data|
      base_time = 3.days.ago

      chat_data[:conversation].each_with_index do |message, index|
        # Create realistic time progression - messages get further apart as conversation progresses
        time_gap = index < 5 ? rand(5..10) : rand(15..40)
        message_time = base_time + time_gap.minutes
        base_time = message_time

        Message.create!(
          chat: chat_data[:chat],
          author: message[:author],
          content: message[:content],
          created_at: message_time,
          updated_at: message_time
        )
      end
      puts "Created chat: #{chat_data[:chat].subject} with 20 messages"
    end

    puts "Sample data created successfully!"
  else
    puts "This task only works in development!"
  end
end
