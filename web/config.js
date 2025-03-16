export const Config = {
	newspaperTitle: 'Dutton County News',
	tabs: {
		showPrisonSentences: false,
		showCityNews: false,
	},
	articles: {
		showImage: true,
		showTitle: true,
		showDate: false,
		showPublisher: true,
		titleMaxLength: 60,
	},
	// Set this to a custom year for the publish year. Otherwise it will use the current date
	customYear: 1889,
	publishArticleControls: [
		['bold', 'italic', 'underline', 'strike'],
		['blockquote', 'image'],
		[{ list: 'ordered' }, { list: 'bullet' }],
	],
	// Remember to align this with QBShared.Jobs
	reporter: [
		{
			grade: 0,
			canPublish: true,
			canEdit: false,
			canDelete: false,
		},
		{
			grade: 1,
			canPublish: true,
			canEdit: true,
			canDelete: true,
		},
		{
			grade: 2,
			canPublish: true,
			canEdit: true,
			canDelete: true,
		},
		{
			grade: 3,
			canPublish: true,
			canEdit: true,
			canDelete: true,
		},
	],
	prisonSentences: {
		imageUrl:
			'https://cdn.discordapp.com/attachments/1083739853407137834/1114160865172795402/Sisika.jpg?w=686&h=386&auto=format',
		imageCaption: 'Sisika Penitentiary',
	},
	text: {
		tabs: {
			newspaper: 'Newspaper',
			prisonSentences: 'Prison sentences',
			reporterActions: 'Reporter actions',
		},
		prisonSentences: {
			title: 'Prison sentences',
			noSentencesAvailable: 'No sentences available',
		},
		reporterActions: {
			title: 'Reporter actions',
			noPermissions: 'You have no reporter permissions.',
			publishNewStory: 'Publish a new story',
			updateStories: 'Update stories',
			deleteStories: 'Delete stories',
			publishStory: {
				textareaPlaceholder: 'Article content..',
				imagePlaceholder: 'Image URL (Optional)',
				titlePlaceholder: 'Title (Required)',
				publish: 'Publish',
				update: 'Update',
				discardChanges: 'Discard changes',
				preview: 'Preview',
				wrongImageFormat:
					'Wrong image format. Either .jpg, .jpeg, .png. .webp, .avif, .gif, or .svg expected',
				required: 'Required',
				cancel: 'Cancel',
			},
		},
		articles: {
			writtenBy: 'Written by',
			on: 'on',
			latestStories: 'Latest stories',
		},
	},
};
