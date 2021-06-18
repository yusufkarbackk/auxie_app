part of 'Screens.dart';

class DiscussionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    User firebaseUser = Provider.of<User>(context);

    return WillPopScope(
      onWillPop: () {
        context.bloc<PageBloc>().add(GoToMainPage(id: firebaseUser.uid));
        return;
      },
      child: Scaffold(
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 24, horizontal: 5),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: ListView(
              children: [
                Text("Disscusion Forum", style: titledText),
                SizedBox(
                  height: 50,
                ),
                StreamBuilder<QuerySnapshot>(
                  stream: DiscussionServices.getDiscussion(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final discussions = snapshot.data.docs;
                      List<DiscussionContent> discussionList = [];
                      for (var discussion in discussions) {
                        final text = discussion.data()['title'];
                        final time = discussion.data()['time'];
                        discussionList.add(DiscussionContent(
                            text: text, discussionId: discussion.id));
                      }
                      return Column(
                        children: discussionList,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      );
                    } else if (snapshot.connectionState ==
                        ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    } else {
                      return Text("Error getting discussions");
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
