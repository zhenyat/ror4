class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.string :title
      t.string :description

      t.timestamps
    end
    Item.create name: 'item1', title: 'Позиция 1', description: 'Это описание первой позиции. Текст не очень большой'
    Item.create name: 'item2', title: 'Позиция 2', description: 'Это описание второй позиции. Текст этого описания уже побольше'
    Item.create name: 'item3', title: 'Позиция 3', description: 'Это описание третьей позиции. Текст не очень большой'
    Item.create name: 'item4', title: 'Позиция 4', description: 'Это описание четвертой позиции. Текст очень большой! Текст очень большой! Текст очень большой! Текст очень большой! Текст очень большой! Конец!!!'
  end
end
