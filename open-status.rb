# -*- coding: utf-8 -*-

Plugin.create(:mikutter_open_status) {
  command(:open_status_url,
          name: _('メッセージをブラウザで開く'),
          condition: Proc.new{ |opt|
            not opt.messages.any?(&:system?)},
          visible: true,
          role: :timeline) do |opt|
    ::Gtk::openurl(opt.message.map(&:perma_link))
  end
}
