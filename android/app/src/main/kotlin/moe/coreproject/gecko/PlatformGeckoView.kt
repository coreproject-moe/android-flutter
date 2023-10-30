package moe.coreproject

import android.os.Bundle
import android.content.Context
import android.graphics.Color
import android.view.View
import io.flutter.plugin.platform.PlatformView
import org.mozilla.geckoview.GeckoRuntime;
import org.mozilla.geckoview.GeckoSession;
import org.mozilla.geckoview.GeckoView;

internal class PlatformGeckoView(context: Context, id: Int, creationParams: Map<String?, Any?>?) : PlatformView {
    companion object {
        private var sRuntime: GeckoRuntime? = null
    }

    override fun getView(): View {
        val view: GeckoView =
        val session = GeckoSession()

        // Workaround for Bug 1758212

        // Workaround for Bug 1758212
        session.setContentDelegate(object : ContentDelegate() {})

        if (sRuntime == null) {
            // GeckoRuntime can only be initialized once per process
            sRuntime = GeckoRuntime.create(this)
        }

        session.open(sRuntime)
        view.setSession(session)
        session.loadUri("about:buildconfig") // Or any other URL...
    }

    override fun dispose() {}


}
